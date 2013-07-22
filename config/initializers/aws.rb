if Settings.env.aws.access_key_id.present?

  s = Settings.env.aws
  AWS.config(access_key_id: s.access_key_id, secret_access_key: s.secret_access_key)

end