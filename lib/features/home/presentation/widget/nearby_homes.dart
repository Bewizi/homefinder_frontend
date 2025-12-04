import 'package:flutter/material.dart';
import 'package:homefinder/core/presentation/constant/image.dart';
import 'package:homefinder/core/presentation/themes/colors.dart';
import 'package:homefinder/core/presentation/ui/widgets/card_container.dart';
import 'package:homefinder/core/presentation/ui/widgets/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NearbyHomes extends StatelessWidget {
  const NearbyHomes({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> houses = [
      {
        'imagePath': AppImages.kStarlightResidence,
        'rating': '4.95',
        'location': 'Oyin Jolayemi Street, Lagos',
        'propertyName': 'Starlight Residence',
        'price': '#3.25M',
        'durationRent': '/year',
        'bed': '3 Bedrooms',
        'bath': '2 Baths',
        'sqft': '1, 200 sqft',
      },
      {
        'imagePath': AppImages.kMaplewoodCottage,
        'rating': '4.93',
        'location': 'House 5, Ngozi Close, Port Harcourt',
        'propertyName': 'Maplewood Cottage',
        'price': '#1.20M',
        'durationRent': '/year',
        'bed': '2 Bedrooms',
        'bath': '2 Baths',
        'sqft': '1, 000 sqft',
      },
      {
        'imagePath': AppImages.kGroveHomestead,
        'rating': '4.90',
        'location': 'Block 3, Victoria Gardens, Lagos',
        'propertyName': 'Grove Homestead',
        'price': '#1.25M',
        'durationRent': '/year',
        'bed': '2 Bedrooms',
        'bath': '2 Baths',
        'sqft': '1, 200 sqft',
      },
      {
        'imagePath': AppImages.kSunnydaleCottage,
        'rating': '4.90',
        'location': 'Block 12, Mercy Estate, Ibadan',
        'propertyName': 'Sunnydale Cottage',
        'price': '#1.50M',
        'durationRent': '/year',
        'bed': '3 Bedrooms',
        'bath': '3 Baths',
        'sqft': '1, 200 sqft',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextRegular(
              'Homes Near You',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.kJet,
            ),
            InkWell(
              onTap: () {},
              child: TextRegular(
                'See all',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.kBrand50,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        SizedBox(
          height: MediaQuery.of(context).size.width * 360 / 380,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: houses.length > 3 ? 3 : houses.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, i) => _HomeCard(data: houses[i]),
          ),
        ),
      ],
    );
  }
}

class _HomeCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const _HomeCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      children: [
        _ImageSection(imagePath: data['imagePath'], rating: data['rating']),

        const SizedBox(height: 12),

        _DetailsSection(
          title: data['propertyName'],
          price: data['price'],
          duration: data['durationRent'],
          location: data['location'],
          bed: data['bed'],
          bath: data['bath'],
          sqft: data['sqft'],
        ),
      ],
    );
  }
}

class _ImageSection extends StatelessWidget {
  final String imagePath;
  final String rating;

  const _ImageSection({required this.imagePath, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: 219,
            fit: BoxFit.cover,
          ),
        ),

        Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _RatingTag(rating: rating),
              _FavoriteButton(),
            ],
          ),
        ),
      ],
    );
  }
}

class _RatingTag extends StatelessWidget {
  final String rating;
  const _RatingTag({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(88),
      ),
      child: Row(
        children: [
          Icon(Icons.star_rounded, size: 12, color: AppColors.kWarning50),
          const SizedBox(width: 4),
          TextRegular(
            rating,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: AppColors.kGrey90,
          ),
        ],
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: FaIcon(
        FontAwesomeIcons.heart,
        size: 16,
        color: AppColors.kBrand50,
      ),
    );
  }
}

class _DetailsSection extends StatelessWidget {
  final String title, price, duration, location, bed, bath, sqft;

  const _DetailsSection({
    required this.title,
    required this.price,
    required this.duration,
    required this.location,
    required this.bed,
    required this.bath,
    required this.sqft,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextRegular(
              title,
              fontWeight: FontWeight.w500,
              color: AppColors.kGrey80,
            ),
            AppRichText(
              text: price,
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.kBrand50,
              textSpan: [
                TextSpan(
                  text: duration,
                  style: TextStyle(color: AppColors.kGrey30, fontSize: 12),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 16,
              color: AppColors.kGrey30,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextRegular(
                location,
                fontSize: 12,
                color: AppColors.kGrey30,

                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: _InfoItem(icon: Icons.bed_outlined, text: bed),
              ),
              VerticalDivider(
                width: 16,
                thickness: 1,
                color: AppColors.kGrey10,
              ),
              Expanded(
                child: _InfoItem(icon: Icons.bathtub_outlined, text: bath),
              ),
              VerticalDivider(
                width: 16,
                thickness: 1,
                color: AppColors.kGrey10,
              ),
              Expanded(
                child: _InfoItem(icon: Icons.bed, text: sqft),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 16, color: AppColors.kGrey30),
        const SizedBox(width: 6),
        Flexible(
          child: TextRegular(
            text,
            fontSize: 12,
            color: AppColors.kGrey30,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
