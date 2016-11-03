class MembershipsController < ApplicationController
  #require MembershipsHelper
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  # GET /memberships
  # GET /memberships.json
  def index
    @memberships = Membership.all
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
  end

  # GET /memberships/new
  def new
    @membership = Membership.new
    @society_options = Society.all.map{ |u| [ u.nombre, u.id ] }
    @formasDePago = FormaDePago.all
  end

  # GET /memberships/1/edit
  def edit
    @society_options = Society.all.map{ |u| [ u.nombre, u.id ] }
    @formasDePago = FormaDePago.all

  end

  # POST /memberships
  # POST /memberships.json
  def create
    @membership = Membership.new(membership_params)
    @membership.t_cedula = params[:tipo_documento]
    @membership.n_cedula =params[:documento]
    @membership.nombreA = params[:nombre]
    @membership.apellido =params[:apellido]
    @membership.telefono =params[:telefono]
    @membership.direccion =params[:direccion]
    @membership.pais =params[:pais]
    @membership.ciudad =params[:ciudad]
    @membership.email =params[:email]
    @membership.valor = params[:valor_pago]
    @membership.soporte = params[:soporte]
    @membership.formaDePago = params[:formaDePago]



    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership, notice: 'La afiliacion se creo exitosamente.' }
        format.json { render :show, status: :created, location: @membership }
        #@receipt = Receipt.new(fecha: params[:category][@membership.fecha_afiliacion], valor_total: params[:category][:valor_pago],
        #soporte: params[:category][:soporte], society_id: params[:category][@membership.society_id], forma_de_pago_id: params[:category][:formaDePago])
      else

        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to @membership, notice: 'Membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to memberships_url, notice: 'Membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def paymentlist
    @memberships = Membership.all

    @societys = Society.all
    @forma = FormaDePago.all
    @society_options = Society.all.map{ |u| [ u.nombre, u.id ] }
  end
  #GET paySocietyQouta/1
  def paySocietyQuota
    @membership = Membership.find(params[:id])


    @formasDePago = FormaDePago.all

    if @membership.periodicidad=='Mensual'
      @valor_pago = @membership.society.val_mensual
    elsif @membership.periodicidad=='Semestral'
      @valor_pago = @membership.society.val_semestral
    elsif @membership.periodicidad=='Anual'


    end
##Son campos para el recibo
    #@membership.f_pago = params[:formaDePago]
    #@client.societyId = params[:society_id]
    #@client.valor=params[:valor_pago]
    #@client.soporte = params[:soporte]

  end
  #payQou
  def payQuota
      @membership = Membership.find(params[:id])
      if @membership.periodicidad=='Mensual'
        @valor_pago = @membership.society.val_mensual
      elsif @membership.periodicidad=='Semestral'
        @valor_pago = @membership.society.val_semestral
      elsif @membership.periodicidad=='Anual'


      end
      t = Time.new
      id = 0
      @membership.clients.each do |client|
        id = client.id
      end
      @membership.s_receipt(t, id, params[:formaDePago], @membership.id, @valor_pago, params[:soporte])
      @membership.updateAcomulado(@valor_pago)


      #@membership.valor = params[:valor_pago]
      #@membership.soporte = params[:soporte]
      #@membership.formaDePago = params[:formaDePago]
      redirect_to membership_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params

      params.require(:membership).permit(:society_id, :periodicidad, :fecha_afiliacion , :fecha_vencimiento, :fecha_cuota,
                                         :tipo_documento, :documento, :nombre, :apellido, :telefono, :direccion, :pais, :ciudad, :email,
                                          :valor_pago, :soporte, :formaDePago)
    end
end
