within IDEAS.Fluid.Valves;
model Thermostatic3WayValve "Thermostatic 3-way valve with hot and cold side"
  extends BaseClasses.Partial3WayValve(vol(energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState));
  Modelica.Blocks.Interfaces.RealInput TMixedSet
    "Mixed outlet temperature setpoint" annotation (Placement(transformation(
        extent={{20,-20},{-20,20}},
        rotation=90,
        origin={0,106}), iconTransformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,100})));

  Modelica.SIunits.SpecificEnthalpy h_set = Medium.specificEnthalpy(Medium.setState_pTX(port_a1.p, TMixedSet, Medium.X_default))
    "Specific enthalpy of the temperature setpoint";

  Modelica.Blocks.Sources.RealExpression realExpression(y=m_flowBottom)
    "Fraction of nominal mass flow rate"
    annotation (Placement(transformation(extent={{74,-60},{34,-40}})));

  Modelica.SIunits.MassFlowRate m_flowBottom(min=0)
    "mass flowrate of cold water to the mixing point";
protected
  Real k "Help variable for determining fraction of each flow";

equation
  k*inStream(port_a2.h_outflow) + inStream(port_a1.h_outflow)*(1-k)=h_set;
  m_flowBottom=-port_b.m_flow*IDEAS.Utilities.Math.Functions.smoothMax(
            IDEAS.Utilities.Math.Functions.smoothMin(k, 1,0.001),
            0,
            0.001);

  connect(realExpression.y, idealSource.m_flow_in) annotation (Line(
      points={{32,-50},{8,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),
            graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),
         graphics={
        Polygon(
          points={{-60,30},{-60,-30},{0,0},{-60,30}},
          lineColor={100,100,100},
          smooth=Smooth.None,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{60,30},{60,-30},{0,0},{60,30}},
          lineColor={100,100,100},
          smooth=Smooth.None),
        Polygon(
          points={{-30,30},{-30,-30},{30,0},{-30,30}},
          lineColor={100,100,100},
          smooth=Smooth.None,
          origin={0,-30},
          rotation=90,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),
        Ellipse(extent={{-20,80},{20,40}}, lineColor={100,100,100}),
        Line(
          points={{0,0},{0,40}},
          color={100,100,100},
          smooth=Smooth.None),
        Text(
          extent={{-10,70},{10,50}},
          lineColor={100,100,100},
          textString="M"),
        Line(
          points={{-70,30},{-70,-30}},
          color={0,0,127},
          smooth=Smooth.None),
        Line(
          points={{70,30},{70,-30}},
          color={0,0,127},
          smooth=Smooth.None),
        Line(
          points={{-30,-70},{30,-70}},
          color={0,0,127},
          smooth=Smooth.None),
        Line(
          points={{-70,0},{-100,0}},
          color={0,0,127},
          smooth=Smooth.None),
        Line(
          points={{70,0},{100,0}},
          color={0,0,127},
          smooth=Smooth.None),
        Line(
          points={{0,-70},{0,-100}},
          color={0,0,127},
          smooth=Smooth.None)}),
    Documentation(info="<html>
<p><b>Description</b> </p>
<p>3-way valve with temperature set point for mixing a cold and hot fluid to obtain outlet fluid at the desired temperature. If the desired temperature is higher than the hot fluid, no mixing will occur and the outlet will have the temperature of the hot fluid. </p>
<p>Inside the valve, the cold water flowrate is fixed with a pump component.  The fluid content in the valve is equally split between the mixing volume and this pump.  Without fluid content in the pump, this model does not work in all operating conditions.  </p>
<p><h4>Assumptions and limitations </h4></p>
<p><ol>
<li>Correct connections of hot and cold fluid to the corresponding flowPorts is NOT CHECKED.</li>
<li>The fluid content m of the valve has to be larger than zero</li>
<li>There is an internal parameter mFlowMin which sets a minimum mass flow rate for mixing to start. </li>
</ol></p>
<p><h4>Model use</h4></p>
<p><ol>
<li>Set medium and the internal fluid content of the valve (too small values of m could increase simulation times)</li>
<li>Set mFlowMin, the minimum mass flow rate for mixing to start. </li>
<li>Supply a set temperature at the outlet</li>
</ol></p>
<p><h4>Validation </h4></p>
<p>None </p>
<p><h4>Example (optional) </h4></p>
<p>Examples of this model can be found in<a href=\"modelica://IDEAS.Thermal.Components.Examples.TempMixingTester\"> IDEAS.Thermal.Components.Examples.TempMixingTester</a> and<a href=\"modelica://IDEAS.Thermal.Components.Examples.RadiatorWithMixingValve\"> IDEAS.Thermal.Components.Examples.RadiatorWithMixingValve</a></p>
</html>", revisions="<html>
<p><ul>
<li>2014 May, Filip Jorissen, Both legs can be hot or cold</li>
<li>2014 March, Filip Jorissen, Annex60 compatibility</li>
<li>2013 May, Roel De Coninck, documentation</li>
<li>2013 March, Ruben Baetens, graphics</li>
<li>2010, Roel De Coninck, first version</li>
</ul></p>
</html>"));
end Thermostatic3WayValve;
