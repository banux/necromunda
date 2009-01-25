class Gangs < Application
  # provides :xml, :yaml, :js

  def index
    @gangs = Gang.all
    display @gangs
  end

  def show(id)
    @gang = Gang.get(id)
    raise NotFound unless @gang
    display @gang
  end

  def new
    only_provides :html
    @gang = Gang.new
    display @gang
  end

  def edit(id)
    only_provides :html
    @gang = Gang.get(id)
    raise NotFound unless @gang
    display @gang
  end

  def create(gang)
    @gang = Gang.new(gang)
    if @gang.save
      redirect resource(@gang), :message => {:notice => "Gang was successfully created"}
    else
      message[:error] = "Gang failed to be created"
      render :new
    end
  end

  def update(id, gang)
    @gang = Gang.get(id)
    raise NotFound unless @gang
    if @gang.update_attributes(gang)
       redirect resource(@gang)
    else
      display @gang, :edit
    end
  end

  def destroy(id)
    @gang = Gang.get(id)
    raise NotFound unless @gang
    if @gang.destroy
      redirect resource(:gangs)
    else
      raise InternalServerError
    end
  end

end # Gangs
