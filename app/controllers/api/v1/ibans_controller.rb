module Api
  module V1
    class IbansController < ApplicationController
      before_action :set_iban, only: %i[show update destroy]

      def index
        render json: Iban.all
      end

      def show
        render json: @iban
      end

      def create
        iban = Iban.new(iban_params)

        if iban.save
          render json: iban, status: :created
        else
          render_error
        end
      end

      def update
        if @iban.update(iban_params)
          render json: @iban, status: :created
        else
          render_error
        end
      end

      def destroy
        @iban.destroy!

        head :no_content
      end

      private

      def iban_params
        params.require(:iban).permit(:name, :iban_number)
      end

      def set_iban
        @iban = Iban.find(params[:id])
      end

      def render_error
        render json: { errors: @iban.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end
