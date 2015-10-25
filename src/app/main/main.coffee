#这里定义主模块。所有模块都需要在这里进行注册。
class ThinCoffee
  constructor:->
    @moduleMap={}
    return

  define:(name, dependencies, factory)->
    # 模块定义的入口
    if (!@moduleMap[name])
      module=
        name:name
        dependencies:dependencies
        factory:factory
      @moduleMap[name] = module
    return @moduleMap[name]
  use:(name)->
    module = @moduleMap[name]
    if (!module.entity) #如果模块没有被实例化
      args = []
      for dependenceName in module.dependencies #module.dependencies是一个字符串数组，表示依赖的包。
        instance=@moduleMap[dependenceName].entity#尝试获取实例
        if (instance?)#实例存在
          args.push(instance)#直接将实例压入参数列表
        else
          args.push(@use(dependenceName)) #先进行实例化，再加入参数列表。（递归调用）
      module.entity = module.factory.apply(@, args)#如果没有实例化才进行实例化
    return module.entity

window.thin = new ThinCoffee
