class Membership < ActiveRecord::Base
  belongs_to :society
  has_many :clients
  belongs_to :user
  has_many :receipts

  accepts_nested_attributes_for :clients
  accepts_nested_attributes_for :receipts

  after_create :save_client
  after_create :fechas
  after_create :save_receipt

  def t_cedula=(cedula)
    @t_c = cedula
  end
  def n_cedula=(numero)
    @numeroC = numero
  end
  def nombreA=(nom)
    @nombreA=nom
  end
  def apellido=(ap)
    @apellido=ap
  end
  def telefono=(tel)
    @telefono=tel
  end
  def direccion=(direc)
    @direccion=direc
  end
  def pais=(pais)
    @pais=pais
  end
  def ciudad=(c)
    @ciudad=c
  end
  def email=(email)
    @email=email
  end
  def formaDePago=(fp)
    @f_pago = fp
  end
  def valor=(value)
    @valor = value
  end
  def soporte=(s)
    @support = s
  end

def save_client
  Client.create( documento: @numeroC, tipo_documento: @t_c, nombre: @nombreA, apellido: @apellido, telefono: @telefono, direccion: @direccion, pais: @pais, ciudad: @ciudad, email: @email, membership_id: self.id)

end
  def save_receipt
    Receipt.create(fecha: self.fecha_afiliacion, client_id: Client.last.id, forma_de_pago_id: @f_pago, membership_id: self.id, valor_total: @valor, soporte: @support)

  end
  def s_receipt(fecha, cliente_id, formaPago, membership_id, valor, soporte )
    Receipt.create(fecha: fecha, client_id: cliente_id, forma_de_pago_id: formaPago, membership_id: membership_id, valor_total: valor, soporte: soporte)

  end
  def updateAcomulado(valor)
    #modificar el volor acomulado por cada cuota

    valorF = self.pago_acomulado+valor
    self.update(pago_acomulado: valorF)

    #cambio de fecha poxima cuota
    fecha = self.fecha_cuota
    if self.periodicidad == 'Anual'

      #self.update(fecha_vencimiento: t+(60*60*24*365))
      #self.update(fecha_cuota: t+(60*60*24*365))
    elsif self.periodicidad == 'Mensual'
      puts (self.fecha_cuota + 2592000)
      #self.update(fecha_vencimiento: fecha+2592000)
      #self.update(fecha_cuota: fecha+2592000 )
    elsif self.periodicidad == 'Semestral'
      #self.update(fecha_cuota: fecha+15768000)
      #self.update(fecha_vencimiento: fecha+15768000)

    end

  end
  def fechas
    t = Time.new
    self.update(fecha_afiliacion: t)
    if self.periodicidad == 'Anual'
      self.update(fecha_vencimiento: t+(60*60*24*365))
      self.update(fecha_cuota: t+(60*60*24*365))
    elsif self.periodicidad == 'Mensual'
      self.update(fecha_vencimiento: t+2592000)
      self.update(fecha_cuota: t+2592000 )
    elsif self.periodicidad == 'Semestral'
      self.update(fecha_cuota: t+15768000)
      self.update(fecha_vencimiento: t+15768000)

    end
      self.update(estado: TRUE)
  end
end



