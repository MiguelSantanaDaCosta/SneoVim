local config = require("config")

-- Carrega plugins core
local plugins = {}
for _, plugin in ipairs(config.settings.core_plugins) do
  table.insert(plugins, require("plugins.core." .. plugin))
end

-- Carrega plugins de linguagem
for lang, settings in pairs(config.settings.languages) do
  if settings.plugin then
    table.insert(plugins, require("plugins.languages." .. lang))
  end
end

return plugins
