class Territories < Application
  # provides :xml, :yaml, :js

  def index
    @territories = Territory.all
    display @territories
  end

  def show(id)
    @territory = Territory.get(id)
    raise NotFound unless @territory
    display @territory
  end

  def new
    only_provides :html
    @territory = Territory.new
    display @territory
  end

  def edit(id)
    only_provides :html
    @territory = Territory.get(id)
    raise NotFound unless @territory
    display @territory
  end

  def create(territory)
    @territory = Territory.new(territory)
    if @territory.save
      redirect resource(@territory), :message => {:notice => "Territory was successfully created"}
    else
      message[:error] = "Territory failed to be created"
      render :new
    end
  end

  def update(id, territory)
    @territory = Territory.get(id)
    raise NotFound unless @territory
    if @territory.update_attributes(territory)
      redirect resource(@territory)
    else
      display @territory, :edit
    end
  end

  def destroy(id)
    @territory = Territory.get(id)
    raise NotFound unless @territory
    if @territory.destroy
      redirect resource(:territories)
    else
      raise InternalServerError
    end
  end

  def del_from_gang(gang, territory)
    @gang = Gang.get(gang[:id])
    raise NotFound unless @gang
    gang_territory = GangTerritory.first(:gang_id => @gang.id, :territory_id => territory[:id])
    gang_territory.destroy
    redirect resource(@gang, :edit)
  end

end # Territories
