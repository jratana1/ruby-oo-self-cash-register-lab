class CashRegister
    attr_accessor :total, :discount, :items, :last
    
    def initialize (discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last = []
    end

    def add_item(title, price, quantity = 1)
        @total += price*quantity
        quantity.times { @items << title }
        @last =[title, price, quantity]
    end

    def apply_discount
        @total = (self.total*(1-(discount/100.0))).to_i
        discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{@total}."
    end

    def void_last_transaction
        @last[2].times {@items.pop}
        @total -= (@last[2]*@last[1])
    end

end