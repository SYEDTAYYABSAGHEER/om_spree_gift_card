Spree::OrderMailer.class_eval do
  def gift_card_email(card_id, order_id)
    @gift_card = Spree::GiftCard.find_by(id: card_id)
    @order = Spree::Order.find_by(id: order_id)
    subject = "#{Spree::Store.current.name} #{Spree.t('gift_card_email.subject')}"
    @gift_card.update_attribute(:sent_at, Time.now)
    mail(to: @gift_card.email, from: from_address, subject: subject)

  end
end
