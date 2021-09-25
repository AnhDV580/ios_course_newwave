//
//  main.swift
//  exercise_1_4
//
//  Created by anhdv on 9/25/21.
//

import Foundation

let mClass : Classroom = Classroom()

main()

func main() -> Void {
    print("Chương trình quản lý sinh viên")
    
    mClass.name = "Lớp học iOS (Newwave)"
    
    while (true) {
        print("------------------------------")
        print("Hãy nhập 1 số để lựa chọn chức năng: ")
        print("1. Chỉnh sửa tên giáo viên.")
        print("2, Thêm sinh viên")
        print("3. Tìm và đổi tên sinh viên")
        print("4. Xoá sinh viên")
        print("5. In ra thông tin của lớp học")
        
        var number = readLine() ?? ""
        number = number.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if (number.isInt) {
            switch Int(number.trimmingCharacters(in: .whitespacesAndNewlines)) {
            case 1:
                editTeacherName()
            case 2:
                addStudent()
            case 3:
                findStudentAndChangeName()
            case 4:
                deleteStudent()
            case 5:
                printClassInformation()
            default:
                print("\nBạn hãy nhập lại. Cần nhập số từ 1 -> 5 để lựa chọn chức năng")
            }
        } else {
            print("\nBạn hãy nhập lại. Cần nhập số từ 1 -> 5 để lựa chọn chức năng")
        }
    }
}

func editTeacherName() -> Void {
    print("Hãy nhập tên giáo viên: ")
    
    var teacherName = readLine()
    teacherName = teacherName?.trimmingCharacters(in: .whitespacesAndNewlines)
    
    mClass.teacherName = teacherName ?? ""
    print("Tên giáo viên: \(teacherName!)")
}

func addStudent() -> Void {
    print("Hãy nhập thông tin sinh viên")
    
    print("Nhập tên: ")
    var name = readLine() ?? ""
    name = name.trimmingCharacters(in: .whitespacesAndNewlines)
    
    print("Nhập tuổi: ")
    let age = Int(readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "") ?? 0

    
    print("Nhập số điện thoại: ")
    var phoneNumber = readLine() ?? ""
    phoneNumber = phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines)


    let newStudent = Student()
    newStudent.name = name
    newStudent.age = age
    newStudent.phone = phoneNumber
    
    mClass.students?.append(newStudent)
    print("Đã thêm thông tin sinh viên: \(newStudent.name)")
}

func findStudentAndChangeName() -> Void {
    print("Tìm và sửa thông tin sinh viên")
    
    print("Nhập tên để tìm kiếm: ")
    var studentName = readLine()
    studentName = studentName?.trimmingCharacters(in: .whitespacesAndNewlines)
    if (mClass.students?.count == 0) {
        print("Lớp không có sinh viên")
    } else {
        let studentCount = (mClass.students?.count)!
        for item in 0..<studentCount {
            if (mClass.students?[item].name ?? "") == studentName {
                print("Hãy nhập tên sinh viên để sửa: ")
                
                var newStudentName = readLine()
                newStudentName = newStudentName?.trimmingCharacters(in: .whitespacesAndNewlines)
                
                mClass.students?[item].name = newStudentName ?? ""
                print("Đã sửa thông tin sinh viên: \(studentName ?? "") -> \(newStudentName ?? "")")
                
                return
            }
        }
        print("Không tìm thấy thông tin sinh viên")
    }
}

func deleteStudent() -> Void {
    print("Xóa thông tin sinh viên")
    
    print("Nhập tên để tìm kiếm: ")
    var studentName = readLine()
    studentName = studentName?.trimmingCharacters(in: .whitespacesAndNewlines)
    
    if (mClass.students?.count == 0) {
        print("Lớp không có sinh viên")
    } else {
        let studentCount = (mClass.students?.count)!
        for item in 0..<studentCount {
            if (mClass.students?[item].name ?? "") == studentName {
                mClass.students?.remove(at: item)
                print("Đã xóa thông tin sinh viên: \(studentName ?? "")")
                return
            }
        }
        print("Không tìm thấy thông tin sinh viên")
    }
    
}

func printClassInformation() -> Void {
    print("\nThông tin lớp học: ")
    print("Tên lớp: \(mClass.name)")
    print("Tên giáo viên: \(mClass.teacherName)")
    
    if (mClass.students?.count == 0) {
        print("Lớp không có sinh viên")
    } else {
        print("Danh sách sinh viên: ")
        let studentCount = (mClass.students?.count)!
        for item in 0..<studentCount {
            print("Sinh viên \(mClass.students?[item].name ?? "") ", terminator: ",")
            print("\((mClass.students?[item].age) ?? 0) tuổi ", terminator: ",")
            print("số điện thoại \(mClass.students?[item].phone ?? "")")
        }
    }
}

extension String  {
    var isInt: Bool {
        return Int(self) != nil
    }
}
