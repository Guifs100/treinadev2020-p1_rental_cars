# class SubsidiariesController < ApplicationController
#   before_action :aunthenticate_user!
#   before_action :authorize_admin!
#   before_action :set_subsidiary, only: %i[show edit update]

#   # TODO: criar Subsidiaries model e testes




#   private

#   def subsidiary_params
#     params.require(:subsidiary).permit(:name, :cnpj, :address)
#   end

#   def set_subsidiary
#     @subsidiary = Subsidiary.find(params[:id])
#   end

#   def authorize_admin
#     redirect_to root_path, notice: 'Não autorizado' unless current_user.admin?
#   end
# end