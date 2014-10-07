module Angular
module DSL
  def ng
    @ng ||= Angular::Setup.new(Capybara.current_session)
  end

  def ng_install
    ng.install
  end

  def ng_wait
    ng.ng_wait
  end

  #
  # @return current location absolute url
  #
  def ng_location_abs(opt = {})
    ng.make_call :getLocationAbsUrl, [using], opt
  end

  # @return current location absolute url
  #
  def ng_location(opt = {})
    ng.make_call :getLocation, [using], opt
  end

  #
  # @return current location
  #
  def ng_set_location(selector, url, opt = {})
    ng.make_call :setLocation, [selector, url], opt
  end

  #
  # @return eval result
  #
  def ng_eval(selector, expr, opt = {})
    ng.make_call :evaluate, [selector, expr], opt
  end

  #
  # Does binding exist
  #
  # @param opt
  # - :exact
  # - :using
  # - :rootSelector
  # - :wait
  # @return true | false
  #
  def has_ng_binding?(binding, opt = {})
    ng_bindings(model, opt)
    true
  rescue NotFound
    false
  end

  #
  # Node for nth binding match
  #
  # @param opt
  # - :row
  # - :exact
  # - :using
  # - :rootSelector
  # - :wait
  # @return nth node
  #
  def ng_binding(binding, opt = {})
    row = ng.row(opt)
    ng_bindings(binding, opt)[row]
  end

  #
  # All nodes matching binding
  #
  # @param opt
  # - :exact
  # - :using
  # - :rootSelector
  # - :wait
  # @return [node, ...]
  #
  def ng_bindings(binding, opt = {})
    ng.get_nodes :findBindings, [binding, opt[:exact]], opt
  end

  #
  # Does model exist
  #
  # @param opt
  # - :using
  # - :rootSelector
  # - :wait
  # @return true | false
  #
  def has_ng_model?(model, opt = {})
    ng_models(model, opt)
    true
  rescue NotFound
    false
  end

  #
  # Node for nth model match
  #
  # @param opt
  # - :row
  # - :using
  # - :rootSelector
  # - :wait
  # @return nth node
  #
  def ng_model(model, opt = {})
    row = ng.row(opt)
    ng_models(model, opt)[row]
  end

  #
  # All nodes matching model
  #
  # @param opt
  # - :using
  # - :rootSelector
  # - :wait
  # @return [node, ...]
  #
  def ng_models(model, opt = {})
    ng.get_nodes :findByModel, [model], opt
  end

  #
  # Does option exist
  #
  # @param opt
  # - :using
  # - :rootSelector
  # - :wait
  # @return true | false
  #
  def has_ng_option?(options, opt = {})
    ng_options(options, opt)
    true
  rescue NotFound
    false
  end

  #
  # Node for nth option
  #
  # @param opt
  # - :row
  # - :using
  # - :rootSelector
  # - :wait
  # @return nth node
  #
  def ng_option(options, opt = {})
    row = ng.row(opt)
    ng_options(options, opt)[row]
  end

  #
  # All option values matching option
  #
  # @param opt
  # - :using
  # - :rootSelector
  # - :wait
  # @return [node, ...]
  #
  def ng_options(options, opt = {})
    ng.get_nodes :findByOptions, [options], opt
  end

  #
  # Does row exist
  #
  # @param opt
  # - :using
  # - :rootSelector
  # - :wait
  # @return true | false
  #
  def has_ng_repeater_row?(repeater, opt = {})
    ng.get_nodes(:findRepeaterRows, [repeater, 0], opt)
    true
  rescue NotFound
    false
  end

  #
  # Node for nth repeater row
  #
  # @param opt
  # - :row
  # - :using
  # - :rootSelector
  # - :wait
  # @return nth node
  #
  def ng_repeater_row(repeater, opt = {})
    row = ng.row(opt)
    data = ng.get_nodes(:findRepeaterRows, [repeater, row], opt)
    data.first
  end

  #
  # All nodes matching repeater
  #
  # @param opt
  # - :using
  # - :rootSelector
  # - :wait
  # @return [node, ...]
  #
  def ng_repeater_rows(repeater, opt = {})
    ng.get_nodes :findAllRepeaterRows, [repeater], opt
  end

  #
  # Node for column binding value in row
  #
  # @param opt
  # - :row
  # - :using
  # - :rootSelector
  # - :wait
  # @return nth node
  #
  def ng_repeater_column(repeater, binding, opt = {})
    row = ng.row(opt)
    ng_repeater_columns(repeater, binding, opt)[row]
  end

  #
  # Node for column binding value in all rows
  #
  # @param opt
  # - :using
  # - :rootSelector
  # - :wait
  # @return [node, ...]
  #
  def ng_repeater_columns(repeater, binding, opt = {})
    ng.get_nodes :findRepeaterColumn, [repeater, binding], opt
  end

  #
  # @param opt
  # - :row
  # - :using
  # - :rootSelector
  # - :wait
  # @return nth node
  #
  def ng_repeater_element(repeater, index, binding, opt = {})
    row = ng.row(opt)
    ng_repeater_elements(repeater, index, binding, opt)[row]
  end

  #
  # @param opt
  # - :using
  # - :rootSelector
  # - :wait
  # @return [node, ...]
  #
  def ng_repeater_elements(repeater, index, binding, opt = {})
    ng.get_nodes :findRepeaterElement, [repeater, index, binding], opt
  end
end
end
