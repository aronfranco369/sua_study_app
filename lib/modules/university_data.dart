class UniversityData {
  static List<String> getUniversityNames(Map<dynamic, dynamic> jsonData) {
    List<String> universityNames = [];
    jsonData['universities'].forEach((university) {
      universityNames.add(university['name']);
    });
    return universityNames;
  }

  static List<String> getCollegeNames(Map<dynamic, dynamic> jsonData, String universityName) {
    List<String> collegeNames = [];
    jsonData['universities'].forEach((university) {
      if (university['name'] == universityName) {
        university['colleges'].forEach((college) {
          collegeNames.add(college['name']);
        });
      }
    });
    return collegeNames;
  }

  static List<String> getCoursesForUniversityAndCollege(Map<dynamic, dynamic> jsonData, String universityName, String collegeName) {
    List<String> courses = [];
    jsonData['universities'].forEach((university) {
      if (university['name'] == universityName) {
        university['colleges'].forEach((college) {
          if (college['name'] == collegeName) {
            college['courses'].forEach((course) {
              courses.add(course['name']);
            });
          }
        });
      }
    });
    return courses;
  }

  static List<String> getYearsForCourse(Map<dynamic, dynamic> jsonData, String universityName, String collegeName, String courseName) {
    List<String> years = [];
    jsonData['universities'].forEach((university) {
      if (university['name'] == universityName) {
        university['colleges'].forEach((college) {
          if (college['name'] == collegeName) {
            college['courses'].forEach((course) {
              if (course['name'] == courseName) {
                years = List.from(course['years'][0]['year']);
              }
            });
          }
        });
      }
    });
    return years;
  }

  static List<String> getSemestersForYear(Map<dynamic, dynamic> jsonData, String universityName, String collegeName, String courseName, String year) {
    List<String> semesters = [];
    jsonData['universities'].forEach((university) {
      if (university['name'] == universityName) {
        university['colleges'].forEach((college) {
          if (college['name'] == collegeName) {
            college['courses'].forEach((course) {
              if (course['name'] == courseName) {
                course['years'].forEach((courseYear) {
                  if (courseYear['year'].contains(year)) {
                    semesters = List.from(courseYear['semesters']);
                  }
                });
              }
            });
          }
        });
      }
    });
    return semesters;
  }

  static List<String> getSemester(Map<dynamic, dynamic> jsonData, String? universityName, String? collegeName, String? courseName, String? year) {
    List<String> semesters = [];
    jsonData['universities'].forEach((university) {
      if (university['name'] == universityName) {
        university['colleges'].forEach((college) {
          if (college['name'] == collegeName) {
            college['courses'].forEach((course) {
              if (course['name'] == courseName) {
                course['years'].forEach((courseYear) {
                  if (courseYear['year'].contains(year)) {
                    semesters = List.from(courseYear['semesters']);
                  }
                });
              }
            });
          }
        });
      }
    });
    return semesters;
  }
}
