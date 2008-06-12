module ActiveScaffoldSortableSubforms
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def active_scaffold_sortable_subform(subsorts)
      subsorts.each_pair do |k,v|
        define_method("#{k.to_s.singularize}_#{v}_form_column") do |record, name|
          text_field_tag(name, record.position, :class => 'association-position hidden', :style => 'display:none') + 
            content_tag(:div, image_tag("arrow_move.png"), :class => "mover") +  
            "<script>as_dd_reorder_setup($('#{name}'));</script>"
        end
      end
    end
  end

end

