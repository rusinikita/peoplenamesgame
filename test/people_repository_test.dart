import 'package:flutter_test/flutter_test.dart';
import 'package:peoplenames/people/people_repository.dart';

const data =
    "[{\"id\": 1,\"photoLink\": \"https://sweetytextmessages.com/wp-content/uploads/2018/01/30-Laughing-Kitty-Meme.jpg\",\"firstName\": \"Павел\",\"lastName\": \"Булич\",\"middleName\": \"\",\"profession\": \"QA\",\"gender\": \"male\"},{\"id\": 2,\"photoLink\": \"https://i.ytimg.com/vi/vQFiRqUcaf8/hqdefault.jpg\",\"firstName\": \"Илья\",\"lastName\": \"Некрасов\",\"middleName\": \"\",\"profession\": \"Android developer\",\"gender\": \"helicopter\"}]";

void main() {
  group('parsing', () {
    test('should parse', () {
      final parsed = parsePeople(data);

      expect(parsed.length, 2);
      expect(parsed[0].id, 1);
      expect(parsed[1].id, 2);
    });
  });
}
