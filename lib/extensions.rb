class Symbol
  def with(*args, &block)
    -> (caller, *rest) { caller.send(self, *rest, *args, &block) }
  end
end

class RuntimeApiError < RuntimeError
end
