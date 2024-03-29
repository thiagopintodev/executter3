class CreateEx2Tables < ActiveRecord::Migration
  def change

	  create_table "cities", force: true do |t|
	    t.integer  "city_base_id"
	    t.integer  "city_id"
	    t.string   "name"
	    t.string   "label"
	    t.string   "country"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  create_table "city_bases", force: true do |t|
	    t.string   "country"
	    t.string   "name"
	    t.string   "label"
	    t.string   "region"
	    t.string   "data"
	    t.integer  "population"
	    t.decimal  "lat"
	    t.decimal  "lng"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  add_index "city_bases", ["data"], name: "index_city_bases_on_data", using: :btree
	  add_index "city_bases", ["label"], name: "index_city_bases_on_label", using: :btree

	  create_table "invites", force: true do |t|
	    t.integer  "user_id"
	    t.string   "email_to"
	    t.string   "name_to"
	    t.string   "token"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  add_index "invites", ["email_to"], name: "index_invites_on_email_to", using: :btree
	  add_index "invites", ["token"], name: "index_invites_on_token", using: :btree
	  add_index "invites", ["user_id"], name: "index_invites_on_user_id", using: :btree

	  create_table "likes", force: true do |t|
	    t.integer  "post_id"
	    t.integer  "user_id"
	    t.boolean  "generated_notifications", default: false
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  create_table "my_configs", force: true do |t|
	    t.string   "key"
	    t.string   "val"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  create_table "post_files", force: true do |t|
	    t.integer  "post_id"
	    t.string   "filename"
	    t.string   "category"
	    t.string   "extension"
	    t.integer  "count_of_downloads", default: 0
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.string   "image_file_name"
	    t.string   "image_content_type"
	    t.integer  "image_file_size"
	    t.datetime "image_updated_at"
	    t.string   "audio_file_name"
	    t.string   "audio_content_type"
	    t.integer  "audio_file_size"
	    t.datetime "audio_updated_at"
	    t.string   "other_file_name"
	    t.string   "other_content_type"
	    t.integer  "other_file_size"
	    t.datetime "other_updated_at"
	  end

	  add_index "post_files", ["post_id"], name: "index_post_files_on_post_id", using: :btree

	  create_table "post_followers", force: true do |t|
	    t.integer  "post_id"
	    t.integer  "user_id"
	    t.string   "reason"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  add_index "post_followers", ["post_id"], name: "index_post_followers_on_post_id", using: :btree
	  add_index "post_followers", ["user_id"], name: "index_post_followers_on_user_id", using: :btree

	  create_table "post_mentions", force: true do |t|
	    t.integer  "post_id"
	    t.string   "value"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  add_index "post_mentions", ["value"], name: "index_post_mentions_on_value", using: :btree

	  create_table "post_user_news", force: true do |t|
	    t.integer  "post_id"
	    t.integer  "user_id"
	    t.integer  "user_id_from"
	    t.string   "reason_trigger"
	    t.string   "reason_why"
	    t.boolean  "is_read",        default: false
	    t.boolean  "is_mailed",      default: false
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  add_index "post_user_news", ["user_id", "is_mailed"], name: "index_post_user_news_on_user_id_and_is_mailed", using: :btree
	  add_index "post_user_news", ["user_id", "is_read", "is_mailed"], name: "index_post_user_news_on_user_id_and_is_read_and_is_mailed", using: :btree
	  add_index "post_user_news", ["user_id", "is_read"], name: "index_post_user_news_on_user_id_and_is_read", using: :btree
	  add_index "post_user_news", ["user_id"], name: "index_post_user_news_on_user_id", using: :btree
	  add_index "post_user_news", ["user_id_from"], name: "index_post_user_news_on_user_id_from", using: :btree

	  create_table "post_words", id: false, force: true do |t|
	    t.integer "post_id"
	    t.string  "word"
	  end

	  add_index "post_words", ["post_id", "word"], name: "index_post_words_on_post_id_and_word", using: :btree
	  add_index "post_words", ["post_id"], name: "index_post_words_on_post_id", using: :btree
	  add_index "post_words", ["word"], name: "index_post_words_on_word", using: :btree

	  create_table "posts", force: true do |t|
	    t.integer  "user_id"
	    t.integer  "post_id"
	    t.string   "placement"
	    t.boolean  "on_timeline",             default: true
	    t.string   "files_categories",        default: "status"
	    t.string   "files_extensions"
	    t.boolean  "generated_notifications", default: false
	    t.string   "body"
	    t.string   "remote_ip",               default: "-"
	    t.integer  "likes_count",             default: 0
	    t.integer  "posts_count",             default: 0
	    t.integer  "post_files_count",        default: 0
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.boolean  "generated_words",         default: false
	    t.string   "origin",                  default: "web"
	    t.string   "image_file_name"
	    t.string   "image_content_type"
	    t.integer  "image_file_size"
	    t.datetime "image_updated_at"
	    t.string   "link_url"
	  end

	  add_index "posts", ["post_id"], name: "index_posts_on_post_id", using: :btree
	  add_index "posts", ["user_id", "on_timeline"], name: "index_posts_on_user_id_and_on_timeline", using: :btree
	  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

	  create_table "relations", force: true do |t|
	    t.integer  "user_id"
	    t.integer  "user2_id"
	    t.boolean  "is_follower"
	    t.boolean  "is_followed"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  add_index "relations", ["user_id", "user2_id", "is_followed"], name: "index_relations_on_user_id_and_user2_id_and_is_followed", using: :btree
	  add_index "relations", ["user_id", "user2_id", "is_follower"], name: "index_relations_on_user_id_and_user2_id_and_is_follower", using: :btree

	  create_table "smiles", force: true do |t|
	    t.string   "key"
	    t.boolean  "is_visible",         default: true
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.string   "image_file_name"
	    t.string   "image_content_type"
	    t.integer  "image_file_size"
	    t.datetime "image_updated_at"
	  end

	  create_table "suggestions", force: true do |t|
	    t.integer  "user_id"
	    t.text     "text"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  create_table "translations", force: true do |t|
	    t.string   "locale"
	    t.string   "key"
	    t.text     "text"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  create_table "user_agents", force: true do |t|
	    t.string   "key"
	    t.integer  "count",      default: 1
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  add_index "user_agents", ["key"], name: "index_user_agents_on_key", using: :btree

	  create_table "user_photos", force: true do |t|
	    t.integer  "user_id"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.string   "image_file_name"
	    t.string   "image_content_type"
	    t.integer  "image_file_size"
	    t.datetime "image_updated_at"
	  end

	  add_index "user_photos", ["user_id"], name: "index_user_photos_on_user_id", using: :btree

	  create_table "user_sessions", force: true do |t|
	    t.integer  "user_id"
	    t.string   "authentication_token"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  create_table "user_themes", force: true do |t|
	    t.integer  "user_id"
	    t.string   "flavour"
	    t.string   "background_color",   default: "#ffffff"
	    t.integer  "background_repeat"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.string   "image_file_name"
	    t.string   "image_content_type"
	    t.integer  "image_file_size"
	    t.datetime "image_updated_at"
	  end

	  add_index "user_themes", ["user_id"], name: "index_user_themes_on_user_id", using: :btree

	  create_table "users", force: true do |t|
	    t.string   "email"
	    t.string   "username"
	    t.boolean  "email_confirmed",        default: false
	    t.boolean  "username_confirmed",     default: false
	    t.string   "password_digest"
	    t.string   "password_salt"
	    t.string   "authentication_token"
	    t.integer  "user_photo_id"
	    t.integer  "user_theme_id"
	    t.string   "privileges_string"
	    t.string   "relations_count_string"
	    t.string   "posts_count_string"
	    t.integer  "likes_count",            default: 0
	    t.string   "bio"
	    t.string   "website"
	    t.string   "first_name"
	    t.string   "last_name"
	    t.integer  "sex",                    default: 0
	    t.date     "born_at"
	    t.boolean  "likes_male",             default: false
	    t.boolean  "likes_female",           default: false
	    t.string   "locale"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.string   "cached_photo_url"
	    t.integer  "last_read_post_id"
	    t.integer  "born_city_id"
	    t.integer  "living_city_id"
	  end

	  add_index "users", ["email"], name: "index_users_on_email", using: :btree
	  add_index "users", ["id", "email"], name: "index_users_on_id_and_email", using: :btree
	  add_index "users", ["id", "username"], name: "index_users_on_id_and_username", using: :btree
	  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  end
end
