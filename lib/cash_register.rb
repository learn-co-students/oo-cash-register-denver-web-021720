require 'pry'
class CashRegister
    attr_accessor :total,:discount,:items,:last_item

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @cart = []
    end

    def add_item(title,price,qty=1)
        @total += (price * qty)
        @cart << {
            title: title,
            price: price,
            qty: qty}
        i = 0
        until i == qty
            @items << title
            i+=1
        end

    end
    
    def apply_discount
        if @discount == 0
            p "There is no discount to apply."
        else
            @total -= (@total * (@discount.to_f/100)).to_i
            p "After the discount, the total comes to $#{@total}."
        end
    end

    def void_last_transaction
        last_transaction_item = @cart.find do |item|
            item[:title] == @items[-1]
        end
        @total -= (last_transaction_item[:price]*last_transaction_item[:qty])
    end
end 