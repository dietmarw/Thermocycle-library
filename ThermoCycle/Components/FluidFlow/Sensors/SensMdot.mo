within ThermoCycle.Components.FluidFlow.Sensors;
model SensMdot "Mass Flowrate sensor for working fluid"
  extends ThermoCycle.Icons.Water.SensThrough;
  replaceable package Medium = Media.R245fa constrainedby
    Modelica.Media.Interfaces.PartialMedium "Medium Model" annotation (choicesAllMatching = true);
  Modelica.Blocks.Interfaces.RealOutput Mdot annotation (Placement(
        transformation(extent={{60,40},{100,80}}, rotation=0)));
  Interfaces.Fluid.FlangeA InFlow( redeclare package Medium = Medium)
                annotation (Placement(transformation(extent={{-50,-50},{-30,-30}}),
        iconTransformation(extent={{-50,-50},{-30,-30}})));
  Interfaces.Fluid.FlangeB OutFlow( redeclare package Medium = Medium)
                 annotation (Placement(transformation(extent={{30,-50},{50,-30}}),
        iconTransformation(extent={{30,-50},{50,-30}})));
equation
  InFlow.m_flow + OutFlow.m_flow = 0 "Mass balance";
  // Boundary conditions
  InFlow.p = OutFlow.p;
  InFlow.h_outflow = inStream(OutFlow.h_outflow);
  inStream(InFlow.h_outflow) = OutFlow.h_outflow;
  Mdot = InFlow.m_flow;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}),     graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                    graphics={Text(
          extent={{-42,86},{40,26}},
          lineColor={0,0,0},
          textString="M",
          pattern=LinePattern.Dot,
          lineThickness=0.5), Line(
          points={{-4,86},{0,86},{0,88},{-4,88},{-4,86},{-2,88},{0,88}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None)}),
    Documentation(info="<HTML>
<p>This component can be inserted in a hydraulic circuit to measure the flowrate of the fluid flowing through it.
<p>Flow reversal is supported.
</HTML>",
        revisions="<html>
<ul>
<li><i>16 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Standard medium definition added.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"));
end SensMdot;