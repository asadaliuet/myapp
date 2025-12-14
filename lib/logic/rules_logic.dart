import '../models/result_model.dart';

class RulesLogic {
  
  // --- MATCHING ALGORITHM ---
  static List<RecommendationResult> getTopRecommendations({
    required String buildingType,
    required String region,
    required String material,
    required String priority,
    required String system,
  }) {
    List<RecommendationResult> results = [];

    for (var rule in _pcmRulesData) {
      int score = 0;
      String condition = (rule['if'] as String).toLowerCase();

      // Scoring Logic:
      // We check if the rule's "IF" condition contains the user's selection.
      
      // 1. Building Type (High Weight: 3)
      if (condition.contains(buildingType.toLowerCase())) score += 3;

      // 2. Region/Climate (High Weight: 3)
      // Handle "Hot" matching "Hot-Dry"
      if (condition.contains(region.toLowerCase())) score += 3;

      // 3. Material (Medium Weight: 2)
      if (condition.contains(material.toLowerCase())) score += 2;

      // 4. Priority (Low Weight: 1)
      if (priority.isNotEmpty && condition.contains(priority.toLowerCase())) score += 1;

      // 5. System (Low Weight: 1)
      if (system.isNotEmpty && condition.contains(system.toLowerCase())) score += 1;

      // Threshold: Only keep results that match at least Building & Region (Score >= 6) 
      // or a strong mix of others.
      if (score >= 4) {
        
        // Parse the "THEN" string to extract Material vs Position
        String thenStr = rule['then'] as String;
        String mat = "Unknown PCM";
        String pos = "See justification";

        // Logic: Split by " AND locate PCM "
        // Example: "select paraffin wax as PCM AND locate PCM behind the outer surface"
        if (thenStr.contains(" AND locate PCM ")) {
          List<String> parts = thenStr.split(" AND locate PCM ");
          mat = parts[0].replaceAll("select ", "").replaceAll(" as PCM", "").trim();
          pos = parts[1].trim();
        } else {
          mat = thenStr;
        }

        results.add(RecommendationResult(
          ruleId: rule['no'] as int,
          pcmMaterial: mat,
          position: pos,
          confidence: rule['cf'] as String,
          justification: rule['justification'] as String,
          reference: rule['reference'] as String,
          matchScore: score,
        ));
      }
    }

    // Sort by Score (Highest first)
    results.sort((a, b) => b.matchScore.compareTo(a.matchScore));

    // Return Top 3
    return results.take(3).toList();
  }

  // --- THE 60 RULES DATA ---
  static final List<Map<String, dynamic>> _pcmRulesData = [
    {
      "no": 1,
      "if": "building type is office AND region is hot (temperature range: 30°C to 45°C) AND building material is concrete AND economical aspect prioritized AND mechanical cooling system used",
      "then": "select paraffin wax as PCM AND locate PCM behind the outer surface",
      "cf": "H",
      "justification": "Paraffin wax is cost-effective and can effectively reduce cooling loads in concrete office buildings in hot climates. Positioning behind the outer surface achieves heat gain reduction within walls by 10-40%.",
      "reference": "(Zhang et al., 2018; Lei et al., 2016)"
    },
    {
      "no": 2,
      "if": "building type is office AND region is hot (temperature range: 25°C to 40°C) AND building material is wood AND economical aspect prioritized AND free-running/night ventilation system applied",
      "then": "select paraffin wax as PCM AND locate PCM behind the inner surface",
      "cf": "H",
      "justification": "Paraffin wax is cost-effective and reduces cooling loads in wooden office buildings. Positioning behind the inner surface achieves better peak indoor temperature reduction and time delay.",
      "reference": "(Copyright & ASHRAE, 2007; Frahat et al., 2023)"
    },
    {
      "no": 3,
      "if": "building type is office AND region is hot (temperature range: 30°C to 45°C) AND building material is brick AND kinetic properties prioritized AND wall has multiple column of holes",
      "then": "select bio-based fatty acids as PCM AND locate PCM into the middle holes of the brick structure",
      "cf": "M-H",
      "justification": "Bio-based fatty acids offer fast kinetics for rapid heat transfer in hot climates. For perforated brick walls, placing PCM in the middle holes achieves the highest reduction in total heat flux (up to 82%).",
      "reference": "(Zhou et al., 2019; Hichem et al., 2013)"
    },
    {
      "no": 4,
      "if": "building type is residential AND region is cold (temperature range: -5°C to 15°C) AND building material is wood AND technical aspect prioritized",
      "then": "select paraffin wax as PCM AND locate PCM behind the inner surface",
      "cf": "H",
      "justification": "Paraffin wax offers good thermal conductivity. Positioning behind the inner surface allows PCM to directly release energy to the space during night hours.",
      "reference": "(Fang et al., 2017; Al-Absi et al., 2020)"
    },
    {
      "no": 5,
      "if": "building type is residential AND region is cold (temperature range: -5°C to 15°C) AND building material is insulation AND chemical properties prioritized",
      "then": "select stearic acid as PCM AND locate PCM in the middle part of wall structure",
      "cf": "M",
      "justification": "Stearic acid exhibits good chemical stability. Positioning in the middle layer achieves peak reduction in thermal load.",
      "reference": "(Fang et al., 2017; Fateh et al., 2017)"
    },
    {
      "no": 6,
      "if": "building type is commercial AND region is hot (temperature range: 25°C to 40°C) AND building material is concrete AND chemical properties prioritized",
      "then": "select magnesium nitrate hexahydrate/potassium nitrate eutectic mixture as PCM AND locate PCM behind the outer surface",
      "cf": "M-H",
      "justification": "The eutectic mixture offers good chemical stability. Positioning behind the outer surface enables PCM to work as an insulation layer.",
      "reference": "(Wang et al., 2014; Mourid et al., 2018)"
    },
    {
      "no": 7,
      "if": "building type is commercial AND region is hot (temperature range: 25°C to 40°C) AND building material is wood AND economical aspect prioritized",
      "then": "select paraffin wax as PCM AND locate PCM behind the interior surface",
      "cf": "H",
      "justification": "Paraffin wax is cost-effective. Positioning behind the interior surface achieves better reduction in indoor air temperature.",
      "reference": "(Zhang et al., 2018; Zhu et al., 2018)"
    },
    {
      "no": 8,
      "if": "building type is industrial AND region is moderate (10°C to 30°C) AND building material is insulation AND economical aspect prioritized",
      "then": "select paraffin wax as PCM AND locate PCM on mid-outer layer",
      "cf": "H",
      "justification": "Positioning on the mid-outer layer achieves the best results in peak load shifting and reductions during both heating and cooling seasons.",
      "reference": "(Zhang et al., 2018; Zwanzig et al., 2013)"
    },
    {
      "no": 9,
      "if": "climate is hot-dry during summer AND free running/night ventilation system is applied AND wall material is perforated bricks",
      "then": "select paraffin wax as PCM AND locate PCM behind the inner surface",
      "cf": "H",
      "justification": "Paraffin wax is suitable for hot climates. Positioning behind the inner surface achieves better peak indoor temperature reduction.",
      "reference": "(Kong et al., 2013)"
    },
    {
      "no": 10,
      "if": "region is cold AND wall receives high incident solar radiation AND space heating is required",
      "then": "select stearic acid as PCM AND locate PCM behind the interior surface",
      "cf": "H",
      "justification": "Stearic acid's chemical stability makes it suitable. Positioning behind interior surface allows PCM to release stored energy to the space during night.",
      "reference": "(Al-Yasiri & Szabó, 2021)"
    },
    {
      "no": 11,
      "if": "building type is residential AND region is hot (30°C to 45°C) AND building material is brick AND technical aspect prioritized",
      "then": "select paraffin wax as PCM AND locate PCM in the middle part of wall",
      "cf": "M-H",
      "justification": "Paraffin wax has good compatibility with brick. Positioning in middle part reduces total heat flux and improves thermal inertia.",
      "reference": "(Zhang et al., 2018)"
    },
    {
      "no": 12,
      "if": "building type is office AND region is hot-dry summer AND building material is concrete AND free-running system applied",
      "then": "select paraffin wax as PCM AND locate PCM in the middle part",
      "cf": "H",
      "justification": "Positioning in middle part achieves indoor temperature reduction by 2-4°C and humidity reduction by 12%.",
      "reference": "(Zhang et al., 2018; Shi et al., 2014)"
    },
    {
      "no": 13,
      "if": "building type is industrial AND region is hot (30°C to 45°C) AND building material is concrete AND thermodynamic aspect prioritized",
      "then": "select paraffin wax as PCM AND locate PCM behind the outer surface",
      "cf": "H",
      "justification": "Positioning behind outer surface achieves heat gain reduction within walls by 10-40%.",
      "reference": "(Li et al., 2018; Lei et al., 2016)"
    },
    {
      "no": 14,
      "if": "building type is commercial AND region is moderate (10°C to 30°C) AND building material is wood AND technical aspect prioritized",
      "then": "select sodium acetate trihydrate as PCM AND locate PCM towards the interior and away from middle",
      "cf": "H",
      "justification": "Sodium acetate trihydrate offers good compatibility with wood. Positioning towards interior maximizes heat storage and release efficiency.",
      "reference": "(Karaipekli et al., 2006)"
    },
    {
      "no": 15,
      "if": "building type is industrial AND region is cold (-10°C to 10°C) AND building material is insulation AND kinetic properties prioritized",
      "then": "select fatty acids as PCM AND locate PCM in the fourth insulation layer from outer surface",
      "cf": "H",
      "justification": "Fatty acids exhibit rapid kinetics. Positioning in fourth layer from exterior achieves maximum temperature improvement during winter.",
      "reference": "(Fang et al., 2017)"
    },
    {
      "no": 16,
      "if": "building type is office AND region is hot (30°C to 45°C) AND building material is geopolymer concrete",
      "then": "select paraffin wax as PCM AND locate PCM on 50 mm from outer surface",
      "cf": "H",
      "justification": "Positioning 50mm from outer surface of geopolymer concrete walls achieves energy reduction by 28-30%.",
      "reference": "(Li et al., 2018; Cao et al., 2019)"
    },
    {
      "no": 17,
      "if": "building type is residential AND region is cold (-5°C to 15°C) AND building material is brick masonry wall",
      "then": "select stearic acid as PCM AND locate PCM in the mid layer",
      "cf": "H",
      "justification": "Stearic acid exhibits good chemical stability. Positioning in mid layer of brick masonry walls reduces temperature peaks effectively.",
      "reference": "(Fang et al., 2017)"
    },
    {
      "no": 18,
      "if": "building type is office AND region is cold (-5°C to 15°C) AND building material is concrete AND kinetic properties prioritized",
      "then": "select bio-based fatty acids as PCM AND locate PCM behind interior surface or on mid-interior layer",
      "cf": "H",
      "justification": "Bio-based fatty acids offer rapid kinetics. Interior placement allows direct energy release to space during night hours.",
      "reference": "(Zhou et al., 2019)"
    },
    {
      "no": 19,
      "if": "building type is commercial AND region is hot (25°C to 40°C) AND building material is brick AND wall has multiple column of holes",
      "then": "select paraffin wax as PCM AND locate PCM into the middle holes of the brick structure",
      "cf": "H",
      "justification": "Positioning in middle holes achieves highest reduction in total heat flux (up to 82%) in brick walls.",
      "reference": "(Li et al., 2018)"
    },
    {
      "no": 20,
      "if": "building type is residential AND region is moderate (10°C to 30°C) AND building material is wood AND kinetic properties prioritized",
      "then": "select bio-based fatty acids as PCM AND locate PCM in the mid-interior layer",
      "cf": "H",
      "justification": "Rapid kinetics allow absorption and storage of excess heat during off-peak periods.",
      "reference": "(Faraj et al.; Zhou et al., 2019)"
    },
    {
      "no": 21,
      "if": "building type is residential AND region is hot (30°C to 45°C) AND building material is curtain wall AND ventilated double skin façade",
      "then": "select bio-based fatty acids as PCM AND locate PCM within the cavity",
      "cf": "H",
      "justification": "Positioning within cavity of ventilated façade reduces energy consumption for summer cooling.",
      "reference": "(Zhou et al., 2019)"
    },
    {
      "no": 22,
      "if": "building type is office AND region is Mediterranean climate",
      "then": "select paraffin wax as PCM AND locate PCM behind the outer surface",
      "cf": "H",
      "justification": "Positioning behind outer surface achieves average energy consumption reduction of 20%.",
      "reference": "(Mehling & Cabeza, 2008)"
    },
    {
      "no": 23,
      "if": "building type is commercial AND region is hot AND building material is wood AND south oriented high glazed façade",
      "then": "select paraffin wax as PCM AND locate PCM behind the interior surface",
      "cf": "H",
      "justification": "Positioning behind interior surface reduces heat transfer through south-oriented walls with high glazed façades.",
      "reference": "(Zhang et al., 2018)"
    },
    {
      "no": 24,
      "if": "building type is office AND region is cold AND building material is wood AND passive solar heating",
      "then": "select bio-based fatty acids as PCM AND locate PCM behind the outer surface",
      "cf": "H",
      "justification": "Positioning behind outer surface helps absorb heat efficiently from solar radiation.",
      "reference": "(Zhou et al., 2019)"
    },
    {
      "no": 25,
      "if": "building type is residential AND region is hot AND building material is insulation AND temperature swings reduction",
      "then": "select fatty acids as PCM AND locate PCM behind the interior surface",
      "cf": "H",
      "justification": "Positioning behind interior surface absorbs and releases heat, smoothing out temperature fluctuations.",
      "reference": "(Fang et al., 2017)"
    },
    {
      "no": 26,
      "if": "building type is commercial AND region is moderate AND building material is brick AND peak temperature reduction",
      "then": "select bio-based fatty acids as PCM AND locate PCM behind the interior surface",
      "cf": "H",
      "justification": "Positioning behind interior surface allows absorption and delay of heat gain.",
      "reference": "(Zhou et al., 2019)"
    },
    {
      "no": 27,
      "if": "building type is office AND region is hot AND building material is concrete AND economical aspect prioritized",
      "then": "select paraffin wax as PCM AND locate PCM behind the outer surface",
      "cf": "H",
      "justification": "Cost-effective. Behind outer surface achieves heat gain reduction within walls by 10-40%.",
      "reference": "(Zhang et al., 2018)"
    },
    {
      "no": 28,
      "if": "building type is industrial AND region is moderate AND building material is brick AND peak load shifting",
      "then": "select paraffin wax as PCM AND locate PCM in mid-interior layer",
      "cf": "H",
      "justification": "Mid-interior layer allows absorption and storage of excess heat during off-peak periods.",
      "reference": "(Li et al., 2018)"
    },
    {
      "no": 29,
      "if": "building type is residential AND region is hot AND building material is insulation AND high thermal resistance",
      "then": "select paraffin wax as PCM AND locate PCM towards exterior surface",
      "cf": "M-H",
      "justification": "Towards exterior surface allows PCM to receive more temperature variation to complete phase change.",
      "reference": "(Li et al., 2018)"
    },
    {
      "no": 30,
      "if": "building type is office AND region is hot AND building material is concrete AND fire resistance concern",
      "then": "select paraffin wax as PCM AND locate PCM behind the inner surface",
      "cf": "M",
      "justification": "Positioning behind inner surface mitigates flammability issues.",
      "reference": "(Zhang et al., 2018)"
    },
    {
      "no": 31,
      "if": "building type is commercial AND region is hot AND building material is wood AND fire resistance concern",
      "then": "select paraffin wax as PCM AND locate PCM in the wall cavity",
      "cf": "M",
      "justification": "Positioning in wall cavity mitigates flammability issues.",
      "reference": "(Zhang et al., 2018)"
    },
    {
      "no": 32,
      "if": "building type is office AND building location is Southern European AND region is cold",
      "then": "select paraffin wax as PCM AND locate PCM behind the interior surface",
      "cf": "M-H",
      "justification": "Behind interior surface reduces heating/cooling loads in Southern European buildings.",
      "reference": "(Fang et al., 2017)"
    },
    {
      "no": 33,
      "if": "building type is residential AND building location is Central European AND region is cold",
      "then": "select stearic acid as PCM AND locate PCM behind the interior surface",
      "cf": "M",
      "justification": "Positioning behind interior surface reduces energy consumption in Central European buildings.",
      "reference": "(Fang et al., 2017)"
    },
    {
      "no": 34,
      "if": "building type is commercial AND building location is Northern European AND region is cold",
      "then": "select paraffin wax as PCM AND locate PCM behind the interior surface",
      "cf": "M",
      "justification": "Optimizes thermal performance in Northern European buildings.",
      "reference": "(Zhang et al., 2018)"
    },
    {
      "no": 35,
      "if": "building type is industrial AND region is moderate AND building material is wood",
      "then": "select paraffin wax as PCM AND distribute PCM in wall ordered as: wood-PCM-wood-PCM-external finishes",
      "cf": "M",
      "justification": "Achieves lowest internal surface temperatures and peak heat flux in wood walls.",
      "reference": "(Li et al., 2018)"
    },
    {
      "no": 36,
      "if": "building type is office AND region is hot-dry summer AND wall system is ventilated double skin façade",
      "then": "select paraffin wax as PCM AND locate PCM within the cavity",
      "cf": "H",
      "justification": "Positioning within cavity of ventilated façade reduces energy consumption.",
      "reference": "(Zhang et al., 2018)"
    },
    {
      "no": 37,
      "if": "building type is residential AND region is hot AND building material is concrete",
      "then": "select paraffin wax as PCM AND locate PCM in the middle part",
      "cf": "H",
      "justification": "Paraffin wax effectively stores and releases heat in hot residential environments.",
      "reference": "(Li et al., 2018)"
    },
    {
      "no": 38,
      "if": "building type is commercial AND region is hot AND building material is concrete",
      "then": "select paraffin wax as PCM AND locate PCM in the middle part",
      "cf": "H",
      "justification": "Effective heat storage in hot commercial environments with concrete.",
      "reference": "(Li et al., 2018)"
    },
    {
      "no": 39,
      "if": "building type is office AND region has diurnal temperature variations AND building material is concrete",
      "then": "select paraffin wax as PCM AND locate PCM behind the outer surface",
      "cf": "H",
      "justification": "Leverages thermal mass to absorb heat during day and release it at night.",
      "reference": "(Zhang et al., 2018)"
    },
    {
      "no": 40,
      "if": "building type is residential AND region is cold AND building material is concrete AND chemical properties prioritized",
      "then": "select stearic acid as PCM AND locate PCM behind the interior surface",
      "cf": "M",
      "justification": "Stearic acid effectively regulates indoor temperatures in cold residential buildings.",
      "reference": "(Fang et al., 2017)"
    },
    {
      "no": 41,
      "if": "building type is industrial AND region is hot AND building material is insulation AND high melting temperature required",
      "then": "select paraffin wax as PCM AND locate PCM towards exterior surface",
      "cf": "H",
      "justification": "Facilitates higher heat absorption in high thermal resistance walls.",
      "reference": "(Li et al., 2018)"
    },
    {
      "no": 42,
      "if": "building type is office AND region is hot AND building material is brick AND thermodynamic performance prioritized",
      "then": "select paraffin-based PCM (e.g., hexadecane) AND locate PCM in the middle part",
      "cf": "H",
      "justification": "Paraffins offer suitable melting temperatures. Middle part optimizes thermal regulation.",
      "reference": "(Mehling & Cabeza, 2008)"
    },
    {
      "no": 43,
      "if": "building type is commercial AND region is moderate AND building material is concrete AND technical aspect prioritized",
      "then": "select paraffin wax as PCM AND locate PCM in the middle part",
      "cf": "H",
      "justification": "Achieves balanced thermal performance in moderate climates.",
      "reference": "(Zhang et al., 2018)"
    },
    {
      "no": 44,
      "if": "building type is residential AND region is hot AND building material is wood AND wall has no insulation",
      "then": "select sodium acetate trihydrate as PCM AND locate PCM towards exterior surface",
      "cf": "H",
      "justification": "Effectively reduces heat transfer through uninsulated walls.",
      "reference": "(Karaipekli et al., 2006)"
    },
    {
      "no": 45,
      "if": "building type is commercial AND region is hot-dry summer AND building material is rigid foam insulation AND PCM applied on south wall",
      "then": "select paraffin wax as PCM AND locate PCM within cavity between second and third layer from inner surface",
      "cf": "M",
      "justification": "Achieves maximum peak heat flux reduction for south walls.",
      "reference": "(Zhang et al., 2018)"
    },
    {
      "no": 46,
      "if": "building type is commercial AND region is hot-dry summer AND building material is rigid foam insulation AND PCM applied on west wall",
      "then": "select paraffin wax as PCM AND locate PCM within cavity between first and second layer from inner surface",
      "cf": "H",
      "justification": "Achieves maximum peak heat flux reduction for west walls.",
      "reference": "(Zhang et al., 2018)"
    },
    {
      "no": 47,
      "if": "building type is office AND region is cold (-5°C to 15°C) AND building material is concrete AND technical aspect prioritized",
      "then": "select paraffin wax as PCM AND locate PCM behind the interior surface",
      "cf": "H",
      "justification": "Enhances the thermal inertia of the building.",
      "reference": "(Fang et al., 2017)"
    },
    {
      "no": 48,
      "if": "building type is residential AND region is cold (-10°C to 10°C) AND building material is wood AND chemical properties prioritized",
      "then": "select stearic acid as PCM AND locate PCM behind the interior surface",
      "cf": "H",
      "justification": "Provides reliable thermal regulation in wooden residential buildings.",
      "reference": "(Al-Yasiri & Szabó, 2021)"
    },
    {
      "no": 49,
      "if": "building type is industrial AND region is moderate AND building material is insulation AND thermodynamic aspect prioritized",
      "then": "select paraffin wax as PCM AND locate PCM on mid-outer layer",
      "cf": "M",
      "justification": "Effectively stores and releases heat when integrated into insulation.",
      "reference": "(Zhang et al., 2018)"
    },
    {
      "no": 50,
      "if": "building type is residential AND region is cold AND building material is insulation AND kinetic properties prioritized",
      "then": "select fatty acids as PCM AND locate PCM behind interior surface or on mid-interior layer",
      "cf": "H",
      "justification": "Fatty acids exhibit rapid kinetics enabling efficient heat transfer.",
      "reference": "(Fang et al., 2017)"
    },
    {
      "no": 51,
      "if": "building type is commercial AND region is hot AND building material is insulation AND PCM thickness is 1 mm",
      "then": "select paraffin wax as PCM AND locate PCM on distance of 1/16 of total wall thickness from inner surface",
      "cf": "H",
      "justification": "Optimizes thermal performance for 1mm thick PCM layer.",
      "reference": "(Zhang et al., 2018)"
    },
    {
      "no": 52,
      "if": "building type is industrial AND region is moderate AND building material is insulation AND PCM thickness is 2 mm",
      "then": "select paraffin wax as PCM AND locate PCM on distance of 2/16 of total wall thickness from inner surface",
      "cf": "H",
      "justification": "Optimizes thermal performance for 2mm thick PCM layer.",
      "reference": "(Li et al., 2018)"
    },
    {
      "no": 53,
      "if": "building type is residential AND region is hot AND building material is insulation AND PCM thickness is 5-7 mm",
      "then": "select paraffin wax as PCM AND locate PCM on distance of 3/16 of total wall thickness from inner surface",
      "cf": "H",
      "justification": "Optimizes thermal performance for 5-7mm thick PCM layers.",
      "reference": "(Li et al., 2018)"
    },
    {
      "no": 54,
      "if": "building type is office AND region is hot AND building material is insulation AND wall is south oriented",
      "then": "select paraffin wax as PCM AND locate PCM behind the interior surface",
      "cf": "H",
      "justification": "Helps reduce heat transfer through south-oriented walls.",
      "reference": "(Zhang et al., 2018)"
    },
    {
      "no": 55,
      "if": "building type is commercial AND region is cold AND building material is insulation",
      "then": "select stearic acid as PCM AND locate PCM behind the interior surface",
      "cf": "H",
      "justification": "Helps reduce heat transfer through walls by utilizing PCM's phase change properties.",
      "reference": "(Fang et al., 2017)"
    },
    {
      "no": 56,
      "if": "building type is residential AND region is moderate AND building material is concrete",
      "then": "select paraffin wax as PCM AND locate PCM in the mid-exterior layer",
      "cf": "M",
      "justification": "Allows effective absorption and release of heat within temperature range close to melting point.",
      "reference": "(Zhang et al., 2018)"
    },
    {
      "no": 57,
      "if": "building type is office AND region is hot AND building material is insulation AND nighttime temperature below 27°C",
      "then": "select paraffin wax as PCM AND locate PCM behind the outer surface",
      "cf": "H",
      "justification": "With nighttime temperatures below 27°C reduces annual cooling loads by 64%.",
      "reference": "(Zhang et al., 2018)"
    },
    {
      "no": 58,
      "if": "building type is industrial AND region is hot AND building material is concrete AND reducing external heat gain",
      "then": "select paraffin wax as PCM AND locate PCM behind the exterior surface",
      "cf": "H",
      "justification": "Enables PCM to work as insulation layer that reduces heat gain through wall.",
      "reference": "(Li et al., 2018)"
    },
    {
      "no": 59,
      "if": "building type is residential AND region is cold AND building material is insulation AND reducing internal heat",
      "then": "select stearic acid as PCM AND locate PCM behind interior surface or on mid-interior layer",
      "cf": "H",
      "justification": "Allows direct release of energy to space during night after day absorption.",
      "reference": "(Fang et al., 2017)"
    },
    {
      "no": 60,
      "if": "building type is commercial AND region is hot AND building material is wood",
      "then": "select paraffin wax as PCM AND locate PCM behind mid-interior layer or mid-exterior layer",
      "cf": "H",
      "justification": "Optimal for absorbing sufficient heat during day and releasing acceptable heat during night.",
      "reference": "(Zhang et al., 2018)"
    }
  ];
}