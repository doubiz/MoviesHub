module RequestsHelper
  def get_with_token(user, path, params={}, headers={})
    headers.merge!(retrieve_headers(user))
    get path, params, headers
  end

  def post_with_token(user, path, params={}, headers={})
    headers.merge!(retrieve_headers(user))
    post path, params, headers
  end

  def put_with_token(user, path, params={}, headers={})
    headers.merge!(retrieve_headers(user))
    put path, params, headers
  end

  def delete_with_token(user, path, params={}, headers={})
    headers.merge!(retrieve_headers(user))
    delete path, params, headers
  end
end