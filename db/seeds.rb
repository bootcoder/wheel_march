User.destroy_all
Ride.destroy_all
DriverDetail.destroy_all
Invitation.destroy_all

u1 = User.create(
                username: 'tom',
                first_name: 'tom',
                last_name: 'tomtom',
                email: 'tom@tom.com',
                phone: '(415) 555-5555',
                zip: '94127',
                password: 'tomtom',
                password_confirmation: 'tomtom'
                )

u2 = User.create(
                username: 'tim',
                first_name: 'tim',
                last_name: 'timtim',
                email: 'tim@tim.com',
                phone: '(415) 555-5550',
                zip: '94107',
                password: 'tomtom',
                password_confirmation: 'tomtom'
                )

u3 = User.create(
                username: 'tina',
                first_name: 'tina',
                last_name: 'tinatina',
                email: 'tina@tina.com',
                phone: '(415) 555-5551',
                zip: '94107',
                password: 'tomtom',
                password_confirmation: 'tomtom'
                )

u4 = User.create(
                username: 'trina',
                first_name: 'trina',
                last_name: 'trinatrina',
                email: 'trina@trina.com',
                phone: '(415) 555-5551',
                zip: '94107',
                password: 'tomtom',
                password_confirmation: 'tomtom'
                )


d1 = DriverDetail.create(
                        make: 'Tesla',
                        model: 'Model S',
                        tag: 'ZeroCool',
                        driver: u1
                        )

r1 = Ride.create(
                driver: u1,
                max_seats: 2,
                max_range: 3,
                start_time: DateTime.now + 1
                )

i1 = Invitation.create(
                    driver: u1,
                    new_driver: u4,
                    status: 'invited',
                    code: 'AAA1'
                    )

u2.rides << r1
u3.rides << r1
