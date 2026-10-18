import SwiftUI

// Logo Bluetooth Final & Proporsional Sesuai Asli iOS
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

// Tombol Kembali Lingkaran Bundar Khas iOS Modern (Bersih Tanpa Dobel)
struct CircleBackButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }) {
            ZStack {
                Circle()
                    .fill(Color(white: 0.20))
                    .frame(width: 32, height: 32)
                Image(systemName: "chevron.left")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
            }
        }
    }
}

// Modifikator Kotak Proporsional iOS (Radius 24pt, Padding Pas Tidak Terlalu Gemuk)
struct iOSGroupModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 6)
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
                            .padding(.vertical, 8)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "wifi", backgroundColor: .blue)
                                Text("Wi-Fi").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("AWIS D ROKET").font(.system(size: 15)).foregroundColor(Color(white: 0.45))
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 8)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                CustomBluetoothIcon()
                                Text("Bluetooth").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("Tidak Terhubung").font(.system(size: 15)).foregroundColor(Color(white: 0.45))
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 8)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "antenna.radiowaves.left.and.right", backgroundColor: .green)
                                Text("Seluler").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 8)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "personalhotspot", backgroundColor: Color(red: 0.18, green: 0.78, blue: 0.35))
                                Text("Hotspot Pribadi").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("Mati").font(.system(size: 15)).foregroundColor(Color(white: 0.45))
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 8)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "battery.100", backgroundColor: .green)
                                Text("Baterai").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 8)
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
                                .padding(.vertical, 8)
                            }
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "accessibility", backgroundColor: .blue)
                                Text("Aksesibilitas").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 8)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "sparkles", backgroundColor: Color(red: 0.92, green: 0.35, blue: 0.18))
                                Text("Apple Intelligence & Siri").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }
                            .padding(.vertical, 8)
                        }
                        .iOSGroupedContainer()
                        
                        Spacer().frame(height: 85)
                    }
                }
                .navigationTitle("Pengaturan")
                
                // Floating Search Bar Bottom
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
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 26, style: .continuous)
                        .fill(Color(white: 0.15, opacity: 0.50))
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 26, style: .continuous))
                )
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
            }
        }
    }
}

// Ikon Bluetooth Proporsional Final
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

// Menu "Umum" (LENGKAP DENGAN CARD HEADER DESKRIPSI)
struct GeneralSettingsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                // HEADER PENJELASAN UMUM iOS 18/26+
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
                        .padding(.vertical, 8)
                    }
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "gear.badge.checkmark", backgroundColor: .gray)
                        Text("Pembaruan Perangkat Lunak").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 8)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "internaldrive", backgroundColor: .gray)
                        Text("Penyimpanan iPhone").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 8)
                }
                .iOSGroupedContainer()
                
                // SECTION 2
                VStack(spacing: 0) {
                    HStack {
                        SettingsIcon(systemName: "apple.logo", backgroundColor: .red)
                        Text("AppleCare & Garansi").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 8)
                }
                .iOSGroupedContainer()
                
                // SECTION 3
                VStack(spacing: 0) {
                    HStack {
                        SettingsIcon(systemName: "airdrop", backgroundColor: .blue)
                        Text("AirDrop").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 8)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "airplayvideo", backgroundColor: .blue)
                        Text("AirPlay & Kontinuitas").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 8)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "pip", backgroundColor: .gray)
                        Text("Gambar dalam Gambar").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 8)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "viewfinder", backgroundColor: .gray)
                        Text("Pengambilan Layar").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 8)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "car", backgroundColor: .green)
                        Text("CarPlay").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 8)
                }
                .iOSGroupedContainer()
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

// Menu "Mengenai" (LENGKAP UTUH SEPERTI SEMULA)
struct AboutSettingsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(spacing: 0) {
                    HStack { Text("Nama"); Spacer(); Text("iPhone Dimas").foregroundColor(.gray) }.padding(.vertical, 9)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Versi iOS"); Spacer(); Text("26.5").foregroundColor(.gray) }.padding(.vertical, 9)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Nama Model"); Spacer(); Text("iPhone 17 Pro Max").foregroundColor(.gray) }.padding(.vertical, 9)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Nomor Model"); Spacer(); Text("MFYP4PA/A").foregroundColor(.gray) }.padding(.vertical, 9)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Nomor Seri"); Spacer(); Text("KJX6WK6357").foregroundColor(.gray) }.padding(.vertical, 9)
                }
                .iOSGroupedContainer()
                .padding(.top, 4)
                
                VStack(spacing: 0) {
                    HStack { Text("Garansi Terbatas"); Spacer(); Text("Kedaluwarsa pada 27/12/26").foregroundColor(.gray) }.padding(.vertical, 9)
                }
                .iOSGroupedContainer()
                
                VStack(spacing: 0) {
                    HStack { Text("Lagu"); Spacer(); Text("0").foregroundColor(.gray) }.padding(.vertical, 8)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Video"); Spacer(); Text("1.029").foregroundColor(.gray) }.padding(.vertical, 8)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Foto"); Spacer(); Text("7.862").foregroundColor(.gray) }.padding(.vertical, 8)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Aplikasi"); Spacer(); Text("39").foregroundColor(.gray) }.padding(.vertical, 8)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Kapasitas"); Spacer(); Text("256 GB").foregroundColor(.gray) }.padding(.vertical, 8)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Tersedia"); Spacer(); Text("157,19 GB").foregroundColor(.gray) }.padding(.vertical, 8)
                }
                .iOSGroupedContainer()
                
                VStack(spacing: 0) {
                    HStack { Text("Alamat Wi-Fi"); Spacer(); Text("B8:01:1F:BA:90:38").foregroundColor(.gray) }.padding(.vertical, 8)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Bluetooth"); Spacer(); Text("B8:01:1F:B8:D8:67").foregroundColor(.gray) }.padding(.vertical, 8)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Firmware Modem"); Spacer(); Text("1.60.02").foregroundColor(.gray) }.padding(.vertical, 8)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("SEID"); Spacer(); Text("").foregroundColor(.gray) }.padding(.vertical, 8)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("EID"); Spacer(); Text("89049032020008884800234954216871").font(.system(size: 13)).foregroundColor(.gray) }.padding(.vertical, 8)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Kunci Operator"); Spacer(); Text("Tidak ada pembatasan SIM").foregroundColor(.gray) }.padding(.vertical, 8)
                }
                .iOSGroupedContainer()
                
                VStack(spacing: 0) {
                    HStack { Text("Jaringan"); Spacer(); Text("INDOSATOOREDOO").foregroundColor(.gray) }.padding(.vertical, 8)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Operator"); Spacer(); Text("INDOSAT 70.0").foregroundColor(.gray) }.padding(.vertical, 8)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("IMEI"); Spacer(); Text("35 260231 063492 5").foregroundColor(.gray) }.padding(.vertical, 8)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("ICCID"); Spacer(); Text("89620130003168785752").font(.system(size: 13)).foregroundColor(.gray) }.padding(.vertical, 8)
                }
                .iOSGroupedContainer()
                
                VStack(spacing: 0) {
                    HStack { Text("IMEI2"); Spacer(); Text("35 260231 067993 8").foregroundColor(.gray) }.padding(.vertical, 9)
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

// Entry Point Utama Aplikasi
@main
struct SettingsCloneApp: App {
    var body: some Scene {
        WindowGroup {
            SettingsMainView()
        }
    }
}
