class SettingsController < ApplicationController
  resource_controller

  create.wants.html { redirect_to settings_path }
  update.wants.html { redirect_to settings_path }
end
