import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sanshipt/screens/signup.dart';
import 'package:http/http.dart' as http;

import '../resources/sanshipt_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void signout() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const Signup(),
      ),
    );
    // await FirebaseAuth.instance.signOut();
  }

  Future<void> sendLongText(String input_text) async {
    String url = apiUrl;
    print('res start');
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      // body: {}
      body: jsonEncode({
        'input_text': input_text,
        'model': 'T5',
        'min_length': 40,
        'max_length': 80
      })
    );
    print('${jsonDecode(response.body)['output_text']}');
    print('res end');
  }

  void slt(String s) async {
    sendLongText(s);
  }
  Widget build(BuildContext context) {
    String s = "The tortoise, a reptile of the Testudinidae family, is a fascinating creature with many unique features and adaptations that allow it to thrive in a variety of environments. In this essay, we will explore the physical characteristics, behavior, habitat, and conservation status of the tortoise. The first thing that comes to mind when one thinks of a tortoise is its shell. The shell of a tortoise is made up of two parts: the carapace, which covers the back, and the plastron, which covers the underside. The shell is made up of bone and is covered by scutes, which are thick, bony plates that protect the tortoise from predators and the environment. The shape and size of the shell can vary greatly depending on the species, with some tortoises having streamlined shells for faster movement, and others having dome-shaped shells for protection. Another physical feature of the tortoise is its limbs. Tortoises have short, sturdy legs with sharp claws that are adapted for digging and walking on rough terrain. They are also equipped with a strong neck and powerful jaws that allow them to chew tough vegetation. In terms of behavior, tortoises are known for their slow movement and generally solitary nature. They are also cold-blooded, meaning that they rely on the environment to regulate their body temperature. In order to warm up or cool down, a tortoise will often bask in the sun or seek out shade as necessary. They are also known for their longevity, with some species living well into their 100s. Tortoises are found in a variety of habitats, from deserts and grasslands to forests and wetlands. They are also found on every continent except for Antarctica. Depending on the species, tortoises can have specific habitat requirements, such as access to water or certain types of vegetation. Unfortunately, many species of tortoise are at risk due to habitat loss, poaching, and the pet trade. According to the International Union for Conservation of Nature (IUCN), over 40% of tortoise species are threatened with extinction. Conservation efforts are underway to protect these species, including captive breeding programs and habitat restoration projects. In conclusion, the tortoise is a unique and fascinating creature with many physical and behavioral adaptations that allow it to thrive in diverse environments. However, many species are currently facing threats to their survival, making conservation efforts all the more important. Turtles are fascinating creatures that have been a part of the earth's ecosystem for millions of years. They are unique in their appearance and behavior, and they play an important role in maintaining the balance of the ecosystem. In this essay, we will explore the physical description, habitat, behavior, and importance of turtles in the ecosystem. Turtles are reptiles that come in many different shapes, sizes, and colors. There are over 300 species of turtles, and each has its own unique characteristics. Some turtles have a smooth and streamlined body, while others have a bulky and heavily armored shell. The color of a turtle's shell can range from brown to green to black, and some species have intricate patterns on their shells. The texture of the shell can also vary, from a smooth surface to a rough and bumpy texture. The shell of a turtle is a defining characteristic of the species. It is made up of two parts, the upper part known as the carapace and the lower part known as the plastron. The shell is not just a protective covering but also serves as a storage unit for calcium and other minerals. In addition, turtles have a beak-like mouth and sharp claws that help them to grip onto surfaces and prey. Habitat and Behavior of Turtles can be found in a variety of habitats, including oceans, rivers, lakes, and forests. Some species are aquatic, spending most of their time in the water, while others are terrestrial, living on land. Turtles are known for their unique mating, nesting, and hatching behaviors. Female turtles lay their eggs on land, and the hatchlings emerge from the eggs and make their way to the water. Turtles are also known for their migration patterns. Some species travel long distances to reach their nesting sites, while others migrate to find food or to escape harsh weather conditions. Turtles are solitary creatures, and they spend most of their time alone. They are slow-moving and spend a lot of time basking in the sun to regulate their body temperature. Turtles play an important role in maintaining the balance of the ecosystem. They contribute to nutrient cycling by consuming plants, insects, and other small animals. They also serve as prey for larger animals, such as birds and mammals. In addition, turtles help to control the populations of certain species by consuming their eggs and young. Unfortunately, turtles are facing many threats, including habitat loss, hunting, and pollution. Many species of turtles are endangered, and conservation efforts are needed to protect them. Efforts are being made to protect turtle habitats, regulate hunting, and reduce pollution in their environments. In conclusion, turtles are fascinating creatures that are an important part of the earth's ecosystem. They come in many different shapes, sizes, and colors, and they have unique behaviors and habitats. Turtles play an important role in maintaining the balance of the ecosystem, and they are facing many threats that require conservation efforts. By understanding the physical description, habitat, behavior, and importance of turtles, we can better appreciate and protect these amazing creatures.";
    return Material(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const Center(child: Text("Welcome to home page")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => signout(),
              child: const Text('Log Out'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: ElevatedButton(
                  onPressed: () => slt(s),
                  child: const Text('Send'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
