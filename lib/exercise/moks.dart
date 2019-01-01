import 'entities.dart';

const mockExercise = TextVariantsExercise(
  data: TextVariantsData(
    question: 'Где берут бананы?',
    photoLink:
        'https://sweetytextmessages.com/wp-content/uploads/2018/01/30-Laughing-Kitty-Meme.jpg',
    variants: ['На рынке', 'В бразилии', 'В африке', 'Иди в жопу'],
  ),
  rightAnswer: 'На рынке',
);

const mockExercise2 = TextVariantsExercise(
  data: TextVariantsData(
    question: 'Кто проживает на дне?',
    photoLink:
        'https://i.ytimg.com/vi/vQFiRqUcaf8/hqdefault.jpg',
    variants: ['Ты', 'Я', 'Не я', 'Точно не я'],
  ),
  rightAnswer: 'Не я',
);

const mockExercise3 = TextVariantsExercise(
  data: TextVariantsData(
    question: 'Верите ли вы в бога нашего - Котятку Кути?',
    photoLink:
        'https://i.ytimg.com/vi/fNodQpGVVyg/hqdefault.jpg',
    variants: ['Да', 'Нет', 'Не знаю', 'Кто это?'],
  ),
  rightAnswer: 'Да',
);

const mockList = [mockExercise, mockExercise2, mockExercise3];