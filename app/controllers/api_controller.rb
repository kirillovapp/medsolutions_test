class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :doorkeeper_authorize!
  before_action :current_user

  respond_to :json

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::InvalidAuthenticityToken, with: :forbidden
  rescue_from ActionController::ParameterMissing do |exception|
    if exception.param == :password
      json_error(['Неверно указан пароль'], 422)
    else
      json_error(["Не указан обязательный параметр #{exception.param}"], 422)
    end
  end

  # @return [DoctorAccount]
  def current_user
    return RequestStore.store[:current_user] if RequestStore.store[:current_user]

    if doorkeeper_token
      user = Doctor.find(doorkeeper_token.resource_owner_id)
      RequestStore.store[:current_user] = user
    end
  end

  # API shortcuts
  def json_data(data = {}, status = 200)
    render json: { success: true, data: data }, status: status
  end

  def json_error(errors = ['Ошибка'], status = 401)
    render json: { success: false, errors: errors }, status: status
  end

  def json_ar_error(item, status = 422)
    render json: { success: false, errors: item.errors.full_messages }, status: status
  end

  def not_found
    json_error(['Не найдено'], 404)
  end

  def forbidden
    json_error(['Доступ запрещен'], 403)
  end
end
