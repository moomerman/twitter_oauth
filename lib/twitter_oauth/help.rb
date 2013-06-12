module TwitterOAuth
  class Client

    # Returns the current rate limits for methods belonging to the specified
    # resource families. Each 1.1 API resource belongs to a "resource family"
    # which is indicated in its method documentation. You can typically
    # determine a method's resource family from the first component of the path
    # after the...
    def rate_limit_status
      get('/application/rate_limit_status.json')
    end

  end
end