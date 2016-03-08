module RequestsHelper
  def get_with_token(user_type, path, params={}, headers={})
    headers.merge!(retrieve_headers(user_type))
    get path, params, headers
  end

  def post_with_token(user_type, path, params={}, headers={})
    headers.merge!(retrieve_headers(user_type))
    post path, params, headers
  end

  def put_with_token(user_type, path, params={}, headers={})
    headers.merge!(retrieve_headers(user_type))
    put path, params, headers
  end

  def delete_with_token(user_type, path, params={}, headers={})
    headers.merge!(retrieve_headers(user_type))
    delete path, params, headers
  end
end