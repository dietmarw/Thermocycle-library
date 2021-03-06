within ThermoCycle.Media.Incompressible.IncompressibleCP.Refrigerants;
package TerpeneFromCitrusOils "Terpene From Citrus Oils Incompressible - CoolProp"
//  extends Modelica.Media.Water.StandardWater;


  extends CoolProp2Modelica.Interfaces.IncompressibleCoolPropMedium(
    mediumName = "TCO",
    libraryName = "CoolProp",
    substanceNames = {"TCO|debug=0|enable_TTSE=0"});
end TerpeneFromCitrusOils;
