import 'package:pgd_physics/models/course.dart';

/// PHY 799 – PGD Research Project guidance
/// Not a taught course; practical roadmap for Tochi’s project.
Course buildPhy799() {
  return Course(
    id: 'phy799',
    code: 'PHY 799',
    title: 'PGD Research Project',
    description:
        'A supervised research project in contemporary physics. This section gives you a clear roadmap, expectations, and practical advice so you can plan and finish with confidence.',
    semester: 'Project',
    units: 6,
    icon: '📝',
    colorHint: ColorHint.pink,
    topics: [
      Topic(
        id: 'phy799-t1',
        title: 'What the Project Is and What Is Expected',
        summary: 'Purpose, credit load, and the standard of work expected at PGD level.',
        units: [
          Unit(
            id: 'phy799-t1-u1',
            title: 'Purpose of PHY 799',
            content: r'''
# Purpose of PHY 799

Hey Tochi…

PHY 799 is a **6-unit research project**. It is not another taught course with lectures and weekly quizzes. Instead you investigate a specific question or problem in physics (often linked to electronics, materials, energy, or instrumentation) under the guidance of a supervisor.

The goals are to:
- Apply what you have learned to a real problem
- Learn how to search literature, plan experiments or calculations, and analyse results
- Practise clear scientific writing and presentation
- Produce a substantial report that demonstrates independent work at postgraduate diploma level
''',
            keyTakeaways: [
              'PHY 799 is a supervised research project (6 units).',
              'You investigate a focused question and produce a formal report.',
              'It trains independence, literature use, analysis and scientific communication.',
            ],
            quiz: [
              QuizQuestion(
                id: '799t1u1q1',
                question: 'PHY 799 is primarily…',
                options: [
                  'A set of extra lectures',
                  'A supervised research project leading to a formal report',
                  'Only a group presentation',
                  'An industrial internship with no report',
                ],
                correctIndex: 1,
                explanation: 'It is assessed through the research process and the final written report.',
              ),
            ],
          ),
          Unit(
            id: 'phy799-t1-u2',
            title: 'Typical Expectations',
            content: r'''
# Typical Expectations

While exact requirements depend on your department and supervisor, most PGD projects expect:

- A clear research question or objective
- A short literature review showing you understand previous work
- A sensible methodology (experiment, simulation, measurement, design, or theoretical analysis)
- Presentation of results with appropriate figures/tables
- Discussion of what the results mean and their limitations
- A properly referenced report (usually 30–60 pages depending on local guidelines)
- An oral defence or presentation in many programmes

Start early. A project that is rushed in the last two weeks almost always shows it.
''',
            keyTakeaways: [
              'Clear question, literature, method, results, discussion, references.',
              'Length and exact format follow departmental guidelines.',
              'Starting early is the single biggest practical advantage.',
            ],
            quiz: [
              QuizQuestion(
                id: '799t1u2q1',
                question: 'One of the most common reasons PGD projects struggle is…',
                options: [
                  'Starting far too late',
                  'Using too many references',
                  'Writing too clearly',
                  'Choosing a topic that is too interesting',
                ],
                correctIndex: 0,
                explanation: 'Late starts leave no time for iteration, unexpected problems, or proper writing.',
              ),
            ],
          ),
        ],
      ),
      Topic(
        id: 'phy799-t2',
        title: 'Choosing a Topic and Finding a Supervisor',
        summary: 'How to pick something realistic, interesting, and properly supervised.',
        units: [
          Unit(
            id: 'phy799-t2-u1',
            title: 'Choosing a Good Project Topic',
            content: r'''
# Choosing a Good Project Topic

A good PGD topic is:

- **Interesting to you** – you will spend months with it
- **Feasible** with the equipment, time and knowledge you actually have
- **Specific** enough that you can finish (not “solve climate change”)
- **Related** to the electronics / applied physics flavour of the programme when possible

Examples of realistic directions:
- Characterisation of a simple sensor or thin-film sample
- Design and test of a small electronic instrument or data-logger
- Simulation or modelling of a device or energy system
- Measurement project (noise, efficiency, calibration, etc.)
- Literature + limited experiment on a current materials or energy topic

Discuss ideas with staff early; they know what is practical in the department.
''',
            keyTakeaways: [
              'Interesting + feasible + specific = good topic.',
              'Match the topic to available equipment and time.',
              'Talk to potential supervisors before you finalise.',
            ],
            quiz: [
              QuizQuestion(
                id: '799t2u1q1',
                question: 'A strong PGD project topic should be…',
                options: [
                  'As broad as possible',
                  'Interesting, feasible with available resources, and clearly defined',
                  'Completely unrelated to your courses',
                  'Impossible to finish so it looks ambitious',
                ],
                correctIndex: 1,
                explanation: 'Feasibility and clarity matter as much as interest.',
              ),
            ],
          ),
          Unit(
            id: 'phy799-t2-u2',
            title: 'Working with Your Supervisor',
            content: r'''
# Working with Your Supervisor

Your supervisor is a guide, not a co-author who will do the work for you.

Good habits:
- Agree on a rough timeline and milestones
- Send short progress updates (even when stuck)
- Come to meetings with specific questions and what you have already tried
- Keep a simple lab notebook or digital log of what you did and what happened
- Ask early when equipment, safety or access is an issue

You remain responsible for the final report and for understanding every part of it.
''',
            keyTakeaways: [
              'Supervisor guides; you execute and understand.',
              'Regular, specific communication prevents most disasters.',
              'Document your work continuously.',
            ],
            quiz: [
              QuizQuestion(
                id: '799t2u2q1',
                question: 'When you meet your supervisor it is most helpful to…',
                options: [
                  'Arrive with no preparation and hope they tell you what to do',
                  'Bring specific questions and a short summary of what you have already tried',
                  'Only communicate on the final day',
                  'Avoid mentioning any problems',
                ],
                correctIndex: 1,
                explanation: 'Prepared, specific meetings make the best use of limited supervisor time.',
              ),
            ],
          ),
        ],
      ),
      Topic(
        id: 'phy799-t3',
        title: 'From Literature to Report',
        summary: 'Practical workflow for reading, doing the work, and writing it up.',
        units: [
          Unit(
            id: 'phy799-t3-u1',
            title: 'Literature and Planning',
            content: r'''
# Literature and Planning

Before you build or measure anything substantial:

1. Search for previous work (Google Scholar, department theses, recommended journals).
2. Read the abstracts and conclusions first to decide what is relevant.
3. Note methods, typical values, and open questions.
4. Write a short plan: objective, method, required equipment, timeline, risks.

A one-page plan shared with your supervisor early saves weeks of wasted effort later.
''',
            keyTakeaways: [
              'Survey existing work before heavy experimental effort.',
              'A short written plan is a powerful tool.',
              'Identify risks (equipment, time, safety) early.',
            ],
            quiz: [
              QuizQuestion(
                id: '799t3u1q1',
                question: 'The main reason to read previous work early is…',
                options: [
                  'To copy it word for word',
                  'To learn methods, typical results, and avoid repeating solved problems',
                  'To fill pages with references only',
                  'To delay starting the real work forever',
                ],
                correctIndex: 1,
                explanation: 'Literature informs design choices and shows what is already known.',
              ),
            ],
          ),
          Unit(
            id: 'phy799-t3-u2',
            title: 'Writing the Report',
            content: r'''
# Writing the Report

A typical structure:

1. **Title, abstract, acknowledgements**
2. **Introduction** – context and clear objective
3. **Literature review** – what is already known
4. **Methodology** – what you did and why
5. **Results** – data, graphs, tables (with captions)
6. **Discussion** – interpretation, limitations, comparison with expectations
7. **Conclusion** – what was achieved and possible future work
8. **References** – consistent style (IEEE, APA, or departmental format)

Write as you go. Do not leave all writing until the experiments are finished. Figures and captions deserve as much care as the text.

Nova can help you clarify explanations, structure sections, and improve clarity — but the scientific content and the understanding must be yours.
''',
            keyTakeaways: [
              'Standard scientific structure makes the report easy to follow.',
              'Write continuously; do not postpone all writing to the end.',
              'Figures, captions and references are part of the quality.',
            ],
            quiz: [
              QuizQuestion(
                id: '799t3u2q1',
                question: 'A practical way to avoid a last-minute writing crisis is to…',
                options: [
                  'Write nothing until the final week',
                  'Draft sections (especially methods and results) as the work progresses',
                  'Only prepare slides',
                  'Ignore the literature review',
                ],
                correctIndex: 1,
                explanation: 'Continuous drafting turns the final report into an editing task rather than a creation from zero.',
              ),
            ],
          ),
        ],
      ),
      Topic(
        id: 'phy799-t4',
        title: 'Mindset and Practical Tips',
        summary: 'How to stay steady through the inevitable difficulties.',
        units: [
          Unit(
            id: 'phy799-t4-u1',
            title: 'When Things Go Wrong (They Will)',
            content: r'''
# When Things Go Wrong (They Will)

Equipment fails. Data look messy. A calculation does not match the paper you read. This is normal.

Productive responses:
- Document exactly what happened
- Check the simplest possible causes first
- Ask your supervisor with evidence, not just “it doesn’t work”
- Adjust the scope if necessary — a smaller completed project is better than a grand unfinished one
- Keep the streak of showing up; progress is often uneven

You are learning the real process of research, not performing a perfect demonstration.
''',
            keyTakeaways: [
              'Problems are expected; calm documentation and simple checks come first.',
              'Scope can be adjusted with supervisor agreement.',
              'Consistency beats last-minute heroics.',
            ],
            quiz: [
              QuizQuestion(
                id: '799t4u1q1',
                question: 'If an experiment repeatedly fails, a good next step is…',
                options: [
                  'Hide the problem and invent data',
                  'Document the failure, check simple causes, and discuss with your supervisor',
                  'Abandon the entire degree',
                  'Only complain to friends',
                ],
                correctIndex: 1,
                explanation: 'Transparent troubleshooting and communication are part of professional research practice.',
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
