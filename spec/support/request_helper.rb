module RequestsHelper
  def get_with_token(path, params={}, headers={})
    headers.merge!(retrieve_headers)
    get path, params, headers
  end

  def post_with_token(path, params={}, headers={})
    headers.merge!(retrieve_headers)
    post path, params, headers
  end

  def put_with_token(path, params={}, headers={})
    headers.merge!(retrieve_headers)
    put path, params, headers
  end

  def delete_with_token(path, params={}, headers={})
    headers.merge!(retrieve_headers)
    delete path, params, headers
  end
end