class Gangers < Application
  # provides :xml, :yaml, :js

  def index
    @gangers = Ganger.all
    display @gangers
  end

  def show(id)
    @ganger = Ganger.get(id)
    raise NotFound unless @ganger
    display @ganger
  end

  def new
    only_provides :html
    @ganger = Ganger.new
    @gang = Gang.get(params[:gang_id])
    display @ganger
  end

  def edit(id)
    only_provides :html
    @ganger = Ganger.get(id)
    raise NotFound unless @ganger
    display @ganger
  end

  def create(ganger)
    @ganger = Ganger.new(ganger)
    if @ganger.save
      ganger_gang = GangerGang.new
      ganger_gang.gang_id = params[:gang_id]
      ganger_gang.ganger_id =  @ganger.id
      ganger_gang.save
      redirect resource(@ganger), :message => {:notice => "Ganger was successfully created"}
    else
      message[:error] = "Ganger failed to be created"
      render :new
    end
  end

  def update(id, ganger)
    @ganger = Ganger.get(id)
    raise NotFound unless @ganger
    if @ganger.update_attributes(ganger)
       redirect resource(@ganger)
    else
      display @ganger, :edit
    end
  end

  def destroy(id)
    @ganger = Ganger.get(id)
    raise NotFound unless @ganger
    if @ganger.destroy
      redirect resource(:gangers)
    else
      raise InternalServerError
    end
  end

end # Gangers
