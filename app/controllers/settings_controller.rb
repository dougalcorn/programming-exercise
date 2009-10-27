class SettingsController < ApplicationController
  resource_controller
  before_filter :define_options

  create.wants.html { redirect_to settings_path }
  update.wants.html { redirect_to settings_path }

  private

  def build_object
    type = params[:setting].delete(:type) rescue "Setting"
    klass = type.constantize rescue Setting
    @object ||= klass.new(params[:setting])
  end

  def define_options
    @type_options = [["String", "Setting"]]
    ["Integer", "Float", "Boolean"].each do |name|
      @type_options << [name, "#{name}Setting"]
    end
    @type_options
  end
end
