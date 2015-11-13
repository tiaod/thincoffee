# 事件系统。整个thin框架基于发布订阅模式。
class Event
  constructor:()->
    return
  publish:(topic,data)->
    PubSub.publish(topic,data)
  subscribe:(topic,mySubscriber)->
    #return an token
    return PubSub.subscribe( topic, mySubscriber )

thin.define "$event",[],->
  return new Event
