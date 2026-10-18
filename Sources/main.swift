import SwiftUI

// Logo Bluetooth Asli & Sempurna
struct OfficialBluetoothLogo: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        
        path.move(to: CGPoint(x: w * 0.32, y: h * 0.24))
        path.addLine(to: CGPoint(x: w * 0.68, y: h * 0.50))
        path.addLine(to: CGPoint(x: w * 0.50, y: h * 0.12))
        path.addLine(to: CGPoint(x: w * 0.50, y: h * 0.88))
        path.addLine(to: CGPoint(x: w * 0.68, y: h * 0.50))
        path.addLine(to: CGPoint(x: w * 0.32, y: h * 0.76))
        
        return path
    }
}

// Tombol Kembali Lingkaran Transparan Bersih (Tanpa Dobel)
struct CircleBackButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }) {
            ZStack {
                Circle()
                    .fill(Color(white: 0.25).opacity(0.45))
                    .frame(width: 32, height: 32)
                Image(systemName: "chevron.left")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
            }
        }
    }
}

// Modifikator Kotak Proporsional iOS
struct iOSGroupModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color(red: 0.11, green: 0.11, blue: 0.12))
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .padding(.horizontal, 16)
    }
}

extension View {
    func iOSGroupedContainer() -> some View {
        self.modifier(iOSGroupModifier())
    }
}

struct SettingsMainView: View {
    @State private var isAirplaneModeOn = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Color.black
                    .ignoresSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 16) {
                        
                        // Section 1: Profil Akun Apple
                        HStack(spacing: 16) {
                            Circle()
                                .fill(LinearGradient(
                                    colors: [Color(red: 0.25, green: 0.58, blue: 0.68), Color(red: 0.10, green: 0.25, blue: 0.35)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ))
                                .frame(width: 58, height: 58)
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Dimas Saputra")
                                    .font(.system(size: 19, weight: .semibold))
                                    .foregroundColor(.white)
                                Text("Akun Apple, iCloud, dan lainnya")
                                    .font(.system(size: 13))
                                    .foregroundColor(Color(white: 0.55))
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(Color(white: 0.35))
                        }
                        .padding(.vertical, 6)
                        .iOSGroupedContainer()
                        .padding(.top, 4)
                        
                        // Section 2: Banner Perbarui iOS
                        HStack {
                            Text("Perbarui ke iOS 27.0.1")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.white)
                            Spacer()
                            ZStack {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 19, height: 19)
                                Text("1")
                                    .font(.system(size: 11, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            Image(systemName: "chevron.right")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(Color(white: 0.35))
                        }
                        .padding(.vertical, 6)
                        .iOSGroupedContainer()
                        
                        // Section 3: Konektivitas & Baterai
                        VStack(spacing: 0) {
                            HStack {
                                SettingsIcon(systemName: "airplane", backgroundColor: .orange)
                                Text("Mode Pesawat").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Toggle("", isOn: $isAirplaneModeOn)
                                    .labelsHidden()
                            }
                            .padding(.vertical, 10)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "wifi", backgroundColor: .blue)
                                Text("Wi-Fi").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("Tidak Terhubung").font(.system(size: 15)).foregroundColor(Color(white: 0.45))
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                CustomBluetoothIcon()
                                Text("Bluetooth").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("Tidak Terhubung").font(.system(size: 15)).foregroundColor(Color(white: 0.45))
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "antenna.radiowaves.left.and.right", backgroundColor: .green)
                                Text("Seluler").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("Mati").font(.system(size: 15)).foregroundColor(Color(white: 0.45))
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "personalhotspot", backgroundColor: Color(red: 0.18, green: 0.78, blue: 0.35))
                                Text("Hotspot Pribadi").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("Mati").font(.system(size: 15)).foregroundColor(Color(white: 0.45))
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "battery.100", backgroundColor: .green)
                                Text("Baterai").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                        }
                        .iOSGroupedContainer()
                        
                        // Section 4: Menu Utama Sistem
                        VStack(spacing: 0) {
                            NavigationLink(destination: GeneralSettingsView()) {
                                HStack {
                                    SettingsIcon(systemName: "gear", backgroundColor: .gray)
                                    Text("Umum").font(.system(size: 16)).foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                                }
                                .padding(.vertical, 10)
                            }
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "accessibility", backgroundColor: .blue)
                                Text("Aksesibilitas").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "sparkles", backgroundColor: Color(red: 0.92, green: 0.35, blue: 0.18))
                                Text("Apple Intelligence & Siri").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "magnifyingglass", backgroundColor: .gray)
                                Text("Cari").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "camera.fill", backgroundColor: .gray)
                                Text("Kamera").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "apps.iphone", backgroundColor: .blue)
                                Text("Layar Utama & Perpustakaan App").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "switch.2", backgroundColor: .gray)
                                Text("Pusat Kontrol").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "clock.badge.checkmark.fill", backgroundColor: .black)
                                Text("Siaga").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "sun.max.fill", backgroundColor: .blue)
                                Text("Tampilan & Kecerahan").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "arrow.right.circle.fill", backgroundColor: .blue)
                                Text("Tombol Tindakan").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "circles.hexagongrid.fill", backgroundColor: Color(red: 0.3, green: 0.7, blue: 0.9))
                                Text("Wallpaper").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                        }
                        .iOSGroupedContainer()
                        
                        // Section 5: Pemberitahuan & Lainnya
                        VStack(spacing: 0) {
                            HStack {
                                SettingsIcon(systemName: "bell.badge.fill", backgroundColor: .red)
                                Text("Pemberitahuan").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "speaker.wave.3.fill", backgroundColor: Color(red: 0.95, green: 0.25, blue: 0.45))
                                Text("Bunyi & Haptik").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "moon.fill", backgroundColor: .indigo)
                                Text("Fokus").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "hourglass", backgroundColor: .indigo)
                                Text("Durasi Layar").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 10)
                        }
                        .iOSGroupedContainer()
                        
                        Spacer().frame(height: 95)
                    }
                }
                .navigationTitle("Pengaturan")
                
                // Floating Search Bar Bottom (Lebih Turun & Transparan Kaca Penuh)
                HStack(spacing: 12) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.white.opacity(0.6))
                        .font(.system(size: 16, weight: .semibold))
                    
                    TextField("Cari", text: $searchText)
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                    
                    Image(systemName: "mic.fill")
                        .foregroundColor(Color.white.opacity(0.6))
                        .font(.system(size: 16))
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 13)
                .background(
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .fill(Color(white: 0.12, opacity: 0.40))
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 28, style: .continuous))
                )
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
        }
    }
}

// Ikon Bluetooth Proporsional
struct CustomBluetoothIcon: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7, style: .continuous)
                .fill(Color(red: 0.0, green: 0.48, blue: 1.0))
                .frame(width: 29, height: 29)
            
            OfficialBluetoothLogo()
                .stroke(Color.white, style: StrokeStyle(lineWidth: 2.8, lineCap: .round, lineJoin: .round))
                .frame(width: 13, height: 18)
        }
        .padding(.trailing, 6)
    }
}

// Ikon Standar Settings
struct SettingsIcon: View {
    let systemName: String
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7, style: .continuous)
                .fill(backgroundColor)
                .frame(width: 29, height: 29)
            Image(systemName: systemName)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.trailing, 6)
    }
}

// Menu "Umum"
struct GeneralSettingsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                // HEADER PENJELASAN UMUM iOS
                VStack(alignment: .leading, spacing: 10) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(Color(white: 0.22))
                            .frame(width: 52, height: 52)
                        Image(systemName: "gear")
                            .font(.system(size: 28, weight: .regular))
                            .foregroundColor(.white)
                    }
                    
                    Text("Umum")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Kelola seluruh pengaturan dan preferensi Anda untuk iPhone, seperti pembaruan perangkat lunak, bahasa perangkat, CarPlay, AirDrop, dan lainnya.")
                        .font(.system(size: 14))
                        .foregroundColor(Color(white: 0.60))
                        .lineSpacing(2)
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(red: 0.11, green: 0.11, blue: 0.12))
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .padding(.horizontal, 16)
                .padding(.top, 4)
                
                // SECTION 1
                VStack(spacing: 0) {
                    NavigationLink(destination: AboutSettingsView()) {
                        HStack {
                            SettingsIcon(systemName: "iphone", backgroundColor: .gray)
                            Text("Mengenai").foregroundColor(.white).font(.system(size: 16))
                            Spacer()
                            Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                        }
                        .padding(.vertical, 10)
                    }
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "gear.badge.checkmark", backgroundColor: .gray)
                        Text("Pembaruan Perangkat Lunak").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "internaldrive", backgroundColor: .gray)
                        Text("Penyimpanan iPhone").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                }
                .iOSGroupedContainer()
                
                // SECTION 2
                VStack(spacing: 0) {
                    HStack {
                        SettingsIcon(systemName: "apple.logo", backgroundColor: .red)
                        Text("AppleCare & Garansi").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                }
                .iOSGroupedContainer()
                
                // SECTION 3 (Logo AirDrop Sempurna)
                VStack(spacing: 0) {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 7, style: .continuous)
                                .fill(Color.blue)
                                .frame(width: 29, height: 29)
                            Image(systemName: "airdrop")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .padding(.trailing, 6)
                        Text("AirDrop").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "airplayvideo", backgroundColor: .blue)
                        Text("AirPlay & Kontinuitas").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "pip", backgroundColor: .gray)
                        Text("Gambar dalam Gambar").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "viewfinder", backgroundColor: .gray)
                        Text("Pengambilan Layar").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "car", backgroundColor: .green)
                        Text("CarPlay").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                }
                .iOSGroupedContainer()
                
                // SECTION 4
                VStack(spacing: 0) {
                    HStack {
                        SettingsIcon(systemName: "globe", backgroundColor: .blue)
                        Text("Bahasa & Wilayah").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "textformat", backgroundColor: .gray)
                        Text("Font").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "key.fill", backgroundColor: .gray)
                        Text("Isi-Auto & Kata Sandi").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "book.fill", backgroundColor: .gray)
                        Text("Kamus").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "keyboard", backgroundColor: .gray)
                        Text("Papan Ketik").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "arrow.2.squarepath", backgroundColor: .green)
                        Text("Segarkan App di Latar").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "calendar", backgroundColor: .red)
                        Text("Tanggal & Waktu").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                }
                .iOSGroupedContainer()
                
                // SECTION 5
                VStack(spacing: 0) {
                    HStack {
                        SettingsIcon(systemName: "tv", backgroundColor: .orange)
                        Text("Penyedia TV").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                }
                .iOSGroupedContainer()
                
                // SECTION 6 (Logo VPN Sama / Jaringan)
                VStack(spacing: 0) {
                    NavigationLink(destination: VPNManagementView()) {
                        HStack {
                            SettingsIcon(systemName: "network", backgroundColor: .blue)
                            Text("Manajemen VPN & Perangkat").foregroundColor(.white).font(.system(size: 16))
                            Spacer()
                            Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                        }
                        .padding(.vertical, 10)
                    }
                }
                .iOSGroupedContainer()
                
                // SECTION 7 (Legal Terpisah)
                VStack(spacing: 0) {
                    HStack {
                        SettingsIcon(systemName: "doc.text.fill", backgroundColor: .gray)
                        Text("Legal & Pengatur").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                }
                .iOSGroupedContainer()
                
                // SECTION 8 (Transfer Terpisah)
                VStack(spacing: 0) {
                    HStack {
                        SettingsIcon(systemName: "iphone.gen3", backgroundColor: .blue)
                        Text("Transfer atau Atur Ulang iPhone").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 10)
                }
                .iOSGroupedContainer()
                
                // TOMBOL MATIKAN BIRU
                Button(action: {}) {
                    Text("Matikan")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color(red: 0.11, green: 0.11, blue: 0.12))
                        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                }
                .padding(.horizontal, 16)
                .padding(.top, 4)
            }
            .padding(.bottom, 20)
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CircleBackButton()
            }
        }
        .background(Color.black)
    }
}

// Menu "Mengenai" (Garansi Tanggal di Bawah & Nama "iphone")
struct AboutSettingsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(spacing: 0) {
                    HStack { Text("Nama"); Spacer(); Text("iphone").foregroundColor(.gray) }.padding(.vertical, 11)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Versi iOS"); Spacer(); Text("26.5").foregroundColor(.gray) }.padding(.vertical, 11)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Nama Model"); Spacer(); Text("iPhone 17 Pro Max").foregroundColor(.gray) }.padding(.vertical, 11)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Nomor Model"); Spacer(); Text("MFYP4PA/A").foregroundColor(.gray) }.padding(.vertical, 11)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Nomor Seri"); Spacer(); Text("KJX6WK6357").foregroundColor(.gray) }.padding(.vertical, 11)
                }
                .iOSGroupedContainer()
                .padding(.top, 4)
                
                // GARANSI TERBATAS (Tanggal di Bawah, Kotak Lebih Gemuk Sesuai Asli)
                VStack(alignment: .leading, spacing: 6) {
                    Text("Garansi Terbatas")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                    Text("Kedaluwarsa pada 27/12/26")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color(red: 0.11, green: 0.11, blue: 0.12))
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .padding(.horizontal, 16)
                
                // MEDIA & KAPASITAS (Lebih Berisi/Gemuk Pas)
                VStack(spacing: 0) {
                    HStack { Text("Lagu"); Spacer(); Text("0").foregroundColor(.gray) }.padding(.vertical, 11)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Video"); Spacer(); Text("1.029").foregroundColor(.gray) }.padding(.vertical, 11)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Foto"); Spacer(); Text("7.862").foregroundColor(.gray) }.padding(.vertical, 11)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Aplikasi"); Spacer(); Text("39").foregroundColor(.gray) }.padding(.vertical, 11)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Kapasitas"); Spacer(); Text("256 GB").foregroundColor(.gray) }.padding(.vertical, 11)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Tersedia"); Spacer(); Text("157,19 GB").foregroundColor(.gray) }.padding(.vertical, 11)
                }
                .iOSGroupedContainer()
                
                VStack(spacing: 0) {
                    HStack { Text("Alamat Wi-Fi"); Spacer(); Text("B8:01:1F:BA:90:38").foregroundColor(.gray) }.padding(.vertical, 11)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Bluetooth"); Spacer(); Text("B8:01:1F:B8:D8:67").foregroundColor(.gray) }.padding(.vertical, 11)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Firmware Modem"); Spacer(); Text("1.60.02").foregroundColor(.gray) }.padding(.vertical, 11)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("SEID"); Spacer(); Text("").foregroundColor(.gray) }.padding(.vertical, 11)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("EID"); Spacer(); Text("89049032020008884800234954216871").font(.system(size: 13)).foregroundColor(.gray) }.padding(.vertical, 11)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Kunci Operator"); Spacer(); Text("Tidak ada pembatasan SIM").foregroundColor(.gray) }.padding(.vertical, 11)
                }
                .iOSGroupedContainer()
                
                VStack(spacing: 0) {
                    HStack { Text("Jaringan"); Spacer(); Text("INDOSATOOREDOO").foregroundColor(.gray) }.padding(.vertical, 11)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Operator"); Spacer(); Text("INDOSAT 70.0").foregroundColor(.gray) }.padding(.vertical, 11)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("IMEI"); Spacer(); Text("35 260231 063492 5").foregroundColor(.gray) }.padding(.vertical, 11)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("ICCID"); Spacer(); Text("89620130003168785752").font(.system(size: 13)).foregroundColor(.gray) }.padding(.vertical, 11)
                }
                .iOSGroupedContainer()
                
                VStack(spacing: 0) {
                    HStack { Text("IMEI2"); Spacer(); Text("35 260231 067993 8").foregroundColor(.gray) }.padding(.vertical, 11)
                }
                .iOSGroupedContainer()
                
                // PENGATURAN KEPERCAYAAN SERTIFIKAT
                VStack(spacing: 0) {
                    NavigationLink(destination: CertificateTrustView()) {
                        HStack {
                            Text("Pengaturan Kepercayaan Sertifikat").foregroundColor(.white).font(.system(size: 16))
                            Spacer()
                            Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                        }
                        .padding(.vertical, 11)
                    }
                }
                .iOSGroupedContainer()
            }
            .padding(.bottom, 20)
        }
        .navigationTitle("Mengenai")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CircleBackButton()
            }
        }
        .background(Color.black)
    }
}

// Menu "Manajemen VPN & Perangkat"
struct VPNManagementView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(spacing: 0) {
                    HStack {
                        SettingsIcon(systemName: "network", backgroundColor: .blue)
                        Text("VPN").font(.system(size: 16)).foregroundColor(.white)
                        Spacer()
                        Text("Tidak Terhubung").foregroundColor(.gray)
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }
                    .padding(.vertical, 11)
                }
                .iOSGroupedContainer()
                .padding(.top, 4)
                
                VStack(spacing: 0) {
                    HStack {
                        Text("Masuk ke Akun Kantor atau Sekolah...")
                            .font(.system(size: 15))
                            .foregroundColor(.blue)
                        Spacer()
                    }
                    .padding(.vertical, 11)
                }
                .iOSGroupedContainer()
            }
            .padding(.bottom, 20)
        }
        .navigationTitle("Manajemen VPN & Perangkat")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CircleBackButton()
            }
        }
        .background(Color.black)
    }
}

// Menu "Pengaturan Kepercayaan Sertifikat"
struct CertificateTrustView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 6) {
                VStack(spacing: 0) {
                    HStack {
                        Text("Versi Stok Sertifikat").foregroundColor(.white)
                        Spacer()
                        Text("2026040100").foregroundColor(.gray)
                    }
                    .padding(.vertical, 11)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        Text("Versi Aset Kepercayaan").foregroundColor(.white)
                        Spacer()
                        Text("1013").foregroundColor(.gray)
                    }
                    .padding(.vertical, 11)
                }
                .iOSGroupedContainer()
                .padding(.top, 4)
                
                Button(action: {}) {
                    Text("Pelajari sertifikat terpercaya lebih lanjut")
                        .font(.system(size: 13))
                        .foregroundColor(.blue)
                }
                .padding(.leading, 32)
                .padding(.top, 4)
            }
            .padding(.bottom, 20)
        }
        .navigationTitle("Pengaturan Kepercayaan Sertifikat")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CircleBackButton()
            }
        }
        .background(Color.black)
    }
}

// Entry Point Utama Aplikasi
@main
struct SettingsCloneApp: App {
    var body: some Scene {
        WindowGroup {
            SettingsMainView()
        }
    }
}
