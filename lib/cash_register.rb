class CashRegister
    attr_accessor :total, :discount, :items, :last
    
    def initialize (discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price*quantity
        quantity.times { self.items << title }
        self.last =[title, price, quantity]
    end

    def apply_discount
        self.total = (self.total*(1-(discount/100.0))).to_i
        discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{@total}."
    end

    def void_last_transaction
        self.last[2].times {self.items.pop}
        self.total -= (self.last[2]*self.last[1])
    end

end