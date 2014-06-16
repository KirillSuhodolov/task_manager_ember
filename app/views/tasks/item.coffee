Item = Em.View.extend
  classNames: ['panel']
  tagName: 'div'
  classNameBindings: ['taskStatus']
  templateName: 'tasks/item'

  taskStatus: (->
    switch @get('content.status')
      when 'inProcess' then 'panel-success'
      when 'completed' then 'panel-primary'
      else 'panel-info'
  ).property 'content.status'

`export default Item`