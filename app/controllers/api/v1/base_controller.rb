class Api::V1::BaseController < ApplicationController

  
  private
  
  # jwt token encryption
  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end

  # error and success response
  def success_response code, meta, data
    render  status: code,
            json: {
              meta: meta,
              data: data
            }
  end

  def error_response code, meta, errors
    render  status: code,
            json: {
              meta: meta,
              errors: errors
            }
  end

end