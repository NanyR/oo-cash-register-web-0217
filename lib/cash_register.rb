class CashRegister

  attr_accessor :total, :discount

  def initialize(discount=nil)
    @total=0
    @discount=discount
    @items=[]
    @last_transaction={}
  end

  def add_item (title, price, qty=1)
    qty.times do
      @items.push(title)
    end
    if qty
      @total+=(price *qty)
    end
    @last_transaction=price*qty
  end

  def apply_discount
    if discount
    @total-=(@total * @discount/100)
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total-=@last_transaction
    @items.pop()
  end


end
