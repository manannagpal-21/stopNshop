import 'package:flutter/material.dart';
import '../minor_screens/search.dart';

class FakeSearch extends StatelessWidget {
  const FakeSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
      },
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey, width: 1.4),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const[
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 61, 16, 36),
                  ),
                ),
                Text(
              'What are you looking for?',
              style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 32, 15, 28)),
            ),
              ],
            ),
            Container(
              height: 32,
              width: 75,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 11, 7, 31),
                borderRadius: BorderRadius.circular(25),),
                child: const Center(
                  child: Text(
              'Search',
              style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 159, 131, 55)),
            ),
                ),
            )
          ],
        ),
      ),
    );
  }
}