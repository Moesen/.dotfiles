local Helm = {}

function Helm.is_helm_file(path)
  local check = vim.fs.find("Chart.yaml", {path = vim.fs.dirname(path), upward = true})
end

--@private
--@return string
function Helm.yaml_filetype(path, bufname)
  return is_helm_file(path) and "helm.yaml" or "yaml"
end

--@private
--@return string
function Helm.tmpl_filetype(path, bufname)
  return is_helm_file(path) and "helm.tmpl" or "template"
end

--@private
--@return string
function Helm.tpl_filetype(path, bufname)
  return is_helm_file(path) and "helm.tmpl" or "template"
end

return Helm
