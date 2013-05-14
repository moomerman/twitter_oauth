module TwitterOAuth
  class TwitterDeprecatedError < RuntimeError
  end

  class TwitterRateLimitExceededError < RuntimeError
  end

  class TwitterDuplicateMessageError < RuntimeError
  end

  class TwitterUnknownError < RuntimeError
  end
end
