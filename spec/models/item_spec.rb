require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '新規出品登録' do
    context '新規登録がうまくいくとき' do
      it "image, name, info, category, sale_status, shipping_fee,prefecture, scheduled_delivery, priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end 
    end
    context '新規登録がうまくいかない' do
      it "imageが空では登録できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では登録できないこと" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "infoが空では登録できないこと" do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it "category_idが1では登録できないこと" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "sale_status_idが1では登録できないこと" do
        @item.sale_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sale status must be other than 1")
      end
      it "shipping_fee_idが1では登録できないこと" do
        @item.shipping_fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
      end
      it "prefecture_idが1では登録できないこと" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "scheduled_delivery_idが1では登録できないこと" do
        @item.scheduled_delivery_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
      end
      it "price が空では登録できないこと" do
        @item.price  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300未満では登録できないこと" do
        @item.price  = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが9999999以上では登録できないこと" do
        @item.price  = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが半角数字以外では登録できないこと" do
        @item.price  = "１００AAAAaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
    end
  end
end