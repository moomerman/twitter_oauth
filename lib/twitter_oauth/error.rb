module TwitterOAuth
  class TwitterDeprecatedError < RuntimeError
  end

  class TwitterRateLimitExceededError < RuntimeError
  end

  class TwitterDuplicateMessageError < RuntimeError
  end

  class TwitterUnknownError < RuntimeError
  end

  class TwitterRegionNotFound < RuntimeError
  end

  class TwitterAccessTokenExpired < RuntimeError
  end

  class TwitterBadTokenError < RuntimeError
  end
end
