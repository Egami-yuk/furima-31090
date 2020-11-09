require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @orderaddress = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it "postal_code, prefecture_id, city, address, building, phone_number, tokenが存在すれば購入できる" do
        expect(@orderaddress).to be_valid
      end

      it "buildingが空でも購入できる" do
        @orderaddress.building = ''
        expect(@orderaddress).to be_valid
      end
    end

    context "商品購入がうまくいかない時"
      it "tokenが空だと購入できない" do
        @orderaddress.token = ''
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空だと購入できない" do
        @orderaddress.postal_code = ''
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeにハイフンがないと購入できない" do
        @orderaddress.postal_code = '11111111'
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Postal code Postal code Input correctly")
      end
      it "prefecture_idが1だと購入できない" do
        @orderaddress.prefecture_id = 1
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Prefecture Select")
      end
      it "cityが空だと購入できない" do
        @orderaddress.city = ''
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空だと購入できない" do
        @orderaddress.address = ''
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空だと購入できない" do
        @orderaddress.phone_number = ''
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_number半角数字以外だと購入できない" do
        @orderaddress.phone_number = 'ああああああ'
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_number12桁以上だと購入できない" do
        @orderaddress.phone_number = '1111111111111'
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

  end
end
