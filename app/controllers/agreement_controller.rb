class AgreementController < ApplicationController
  before_action :authenticate_user!, only: [:show, :pay]

  def show
    @product = Product.find(params[:id])
    # @comment = @product.comments.newを修正（下記に変更）
    @comment = Comment.new(product_id: @product.id)
  end

  def pay
    # PayjpAPI実装
    @product = Product.find(params[:transaction_id])
    Payjp.api_key = 'sk_test_004a00e7eccd65878f9b32cf'
    Payjp::Charge.create(
      amount: @product.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )

    # 購入者を記録
    @product.update(buyer_id: current_user.id)
    # 取引ページへ戻る
    redirect_to transaction_agreement_path(@product,@product)
  end

  def shipping
    # 発送通知を送る
    @product = Product.find(params[:transaction_id])
    @product.update(shipping: 1)

    redirect_to transaction_agreement_path(@product,@product)
  end

  def deposit
    # 受取評価をする
    @product = Product.find(params[:transaction_id])
    @product.update(deposit: 1)

    redirect_to transaction_agreement_path(@product,@product)
  end
end
