require "xi/stream"
require "xi/osc"
require "set"

module Xi::Superdirt
  class Stream < Xi::Stream
    include Xi::OSC

    DEFAULT_PARAMS = {
      speed: 1
    }

    def initialize(name, clock, server: "localhost", port: 57120, base_node_id: 2000, **opts)
      debug "Xi::Superdirt initialized"
      super
    end

    def set(params)
      super(gate: params[:gate] || :s, **params)
    end

    private

    def transform_state
      super

      @state = DEFAULT_PARAMS.merge(@state)

      if changed_param?(:db) && !changed_param?(:amp)
        @state[:amp] = @state[:db].db_to_amp
        @changed_params << :amp
      end

      @state[:freq] = 440 * @state[:speed]

      @state[:s] ||= @name.to_s
    end

    def do_gate_on_change(changes)
      debug "Gate on change: #{changes}"

      name = @state[:s]
      state_params = @state.reject { |k, _| %i(gate).include?(k) }
      debug(@state)

      freq = Array(state_params[:freq])

      changes.each do |change|
        at = Time.at(change.fetch(:at))

        change.fetch(:so_ids).each.with_index do |so_id, i|
          freq_i = freq.size > 0 ? freq[i % freq.size] : nil

          send_play2(name, **state_params, freq: freq_i, at: at)
        end
      end
    end

    def send_play2(name, at: Time.now, **args)
      debug "osc_play2: args #{args}"
      send_bundle("/play2",
                  "cps", @clock.cps.to_f,
                  "cycle", @clock.current_cycle.to_f,
                  "delta", 0,
                  *osc_args(args), at: at)
    end

    def osc_args(**args)
      args.map { |k, v| [k.to_s, coerce_osc_value(v)] }.flatten(1)
    end

    def coerce_osc_value(value)
      v = Array(value).first
      v = v.to_f if v.is_a?(Rational)
      v = v.to_s if v.is_a?(Symbol)
      v = v.to_i if !v.is_a?(Float) && !v.is_a?(String)
      v
    end
  end
end
