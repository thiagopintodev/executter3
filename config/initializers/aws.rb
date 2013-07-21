if Settings.env.aws.access_key_id.present?

  AWS.config(Settings.env.aws)

end