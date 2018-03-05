require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    before(:each) do
      @category = Category.new({name: "things"})
      @category.save
    end

    it 'should save if all fields are provided' do
      product = Product.new({name: "Bob", quantity: 5, category: @category, price: 100.00})
      expect { product.save }.to change { Product.count }
    end

    it 'should have a name' do
      product = Product.new({name: nil, quantity: 5, category: @category, price: 100.00})
      product.save
      expect(product.errors.full_messages[0]).to eql("Name can't be blank")
    end

    it 'should have a quantity' do
      product = Product.new({name: "Bob", quantity: nil, category: @category, price: 100.00})
      product.save
      expect(product.errors.full_messages[0]).to eql("Quantity can't be blank")
    end

    it 'should have a price' do
      product = Product.new({name: "Bob", quantity: 5, category: @category, price: nil})
      product.save
      expect(product.errors.full_messages[0]).to eql("Price cents is not a number")
    end

    it 'should belong to a category' do
      product = Product.new({name: "Bob", quantity: 5, category: nil, price: 100.00})
      product.save
      expect(product.errors.full_messages[0]).to eql("Category can't be blank")
    end
  end
end
