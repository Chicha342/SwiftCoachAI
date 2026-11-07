import SwiftUI

struct CalendarView: View {
    @State private var displayedMonth = Date.now
    private let calendar = Calendar.current
    private let weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    @EnvironmentObject var viewModel: MainViewModel
    
    private let columns = Array(
        repeating: GridItem(.flexible(), spacing: 8),
        count: 7
    )
    
    var body: some View {
        VStack{
            
            //Header
            HStack{
                Text("\(monthTitle(for: displayedMonth))")
                    .foregroundStyle(.black)
                    .font(.custom("Outfit-Bold", size: 18))
                
                Spacer()
                
                HStack(spacing: 30){
                    Button(action: {
                        withAnimation {
                            addMouth(by: -1)
                        }
                    }, label: {
                        Image(systemName: "chevron.backward")
                    })
                    
                    Button(action: {
                        withAnimation {
                            addMouth(by: 1)
                        }
                    }, label: {
                        Image(systemName: "chevron.forward")
                    })
                }
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.orange)
            }
            
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(weekdays, id: \.self) { weekday in
                    Text(weekday)
                        .foregroundStyle(.orange)
                        .font(.custom("Outfit-SemiBold", size: 16))
                }
                
                ForEach(monthCells, id: \.self) { date in
                    dayCell(date)
                }
            }
            .padding(.top, 8)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
        .overlay {
            RoundedRectangle(cornerRadius: 30)
                .stroke(.black.opacity(0.23), lineWidth: 3)
        }
        .padding(.horizontal)
        
    }
    
    private func addMouth(by value: Int) {
        displayedMonth = calendar.date(
            byAdding: .month,
            value: value,
            to: displayedMonth) ?? displayedMonth
    }
    
    private func monthTitle(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
    
    //MARK: -- Tyazhest
    private var monthCells: [Date] {
        guard
            let monthInterval = calendar.dateInterval(
                of: .month,
                for: displayedMonth
            ),
            let daysRange = calendar.range(
                of: .day,
                in: .month,
                for: displayedMonth
            )
        else {
            return []
        }

        let firstWeekday = calendar.component(
            .weekday,
            from: monthInterval.start
        )

        let daysBeforeMonth = (firstWeekday + 5) % 7
        let daysInMonth = daysRange.count

        let cellsWithoutEnding = daysBeforeMonth + daysInMonth
        let daysAfterMonth = (7 - cellsWithoutEnding % 7) % 7
        let totalCells = cellsWithoutEnding + daysAfterMonth

        return (0..<totalCells).compactMap { index in
            calendar.date(
                byAdding: .day,
                value: index - daysBeforeMonth,
                to: monthInterval.start
            )
        }
    }

    @ViewBuilder
    private func dayCell(_ date: Date) -> some View {
        let isActive = viewModel.activeDays.contains(activityKey(for: date))
        let isToday = calendar.isDateInToday(date)

        Text("\(calendar.component(.day, from: date))")
            .font(.custom("Outfit-SemiBold", size: 18))
            .foregroundStyle(isActive ? .black : Color(hex: "#3B1307"))
            .frame(width: 42, height: 42)
            .background {
                Circle()
                    .fill(isActive ? .orange : .clear)
            }
            .overlay {
                Circle()
                    .stroke(isToday ? .orange : .clear, lineWidth: 2)
            }
    }

    private func activityKey(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"

        return formatter.string(from: date)
    }
}

#Preview {
    ZStack{
        BackgroundView()
        
        CalendarView()
            .environmentObject(MainViewModel())
    }
}
