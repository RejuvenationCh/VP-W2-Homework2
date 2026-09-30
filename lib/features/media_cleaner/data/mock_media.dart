import '../models/media_item.dart';

const int _mb = 1024 * 1024;

// fake phone storage, 128 GB total with 112 GB used
const int mockTotalBytes = 137438953472;
const int mockUsedBytes = 120259084288;

// mock data
final List<MediaItem> mockMedia = [
  MediaItem(
    id: '1',
    name: 'C0012.MP4',
    category: MediaCategory.video,
    sizeBytes: 3900 * _mb,
    date: DateTime(2026, 8, 14),
  ),
  MediaItem(
    id: '2',
    name: 'C0013.MP4',
    category: MediaCategory.video,
    sizeBytes: 2450 * _mb,
    date: DateTime(2026, 8, 14),
  ),
  MediaItem(
    id: '3',
    name: 'Concert.MOV',
    category: MediaCategory.video,
    sizeBytes: 1300 * _mb,
    date: DateTime(2026, 6, 2),
  ),
  MediaItem(
    id: '4',
    name: 'Rec_0921.mp4',
    category: MediaCategory.screenRecording,
    sizeBytes: 870 * _mb,
    date: DateTime(2026, 9, 21),
  ),
  MediaItem(
    id: '5',
    name: 'Rec_0915.mp4',
    category: MediaCategory.screenRecording,
    sizeBytes: 420 * _mb,
    date: DateTime(2026, 9, 15),
  ),
  MediaItem(
    id: '6',
    name: 'Rec_0903.mp4',
    category: MediaCategory.screenRecording,
    sizeBytes: 230 * _mb,
    date: DateTime(2026, 9, 3),
  ),
  MediaItem(
    id: '7',
    name: 'IMG_4410.HEIC',
    category: MediaCategory.photo,
    sizeBytes: 24 * _mb,
    date: DateTime(2026, 9, 28),
  ),
  MediaItem(
    id: '8',
    name: 'IMG_4402.HEIC',
    category: MediaCategory.photo,
    sizeBytes: 12 * _mb,
    date: DateTime(2026, 9, 25),
  ),
  MediaItem(
    id: '9',
    name: 'IMG_4388.JPG',
    category: MediaCategory.photo,
    sizeBytes: 6 * _mb,
    date: DateTime(2026, 9, 10),
  ),
  MediaItem(
    id: '10',
    name: 'Screenshot_0929.png',
    category: MediaCategory.screenshot,
    sizeBytes: 3 * _mb,
    date: DateTime(2026, 9, 29),
  ),
  MediaItem(
    id: '11',
    name: 'Screenshot_0920.png',
    category: MediaCategory.screenshot,
    sizeBytes: 2 * _mb,
    date: DateTime(2026, 9, 20),
  ),
  MediaItem(
    id: '12',
    name: 'Screenshot_0911.png',
    category: MediaCategory.screenshot,
    sizeBytes: 1 * _mb,
    date: DateTime(2026, 9, 11),
  ),
  // copies of IMG_4410 and IMG_4402
  MediaItem(
    id: '13',
    name: 'IMG_4410 (1).HEIC',
    category: MediaCategory.duplicate,
    sizeBytes: 24 * _mb,
    date: DateTime(2026, 9, 28),
  ),
  MediaItem(
    id: '14',
    name: 'IMG_4410 (2).HEIC',
    category: MediaCategory.duplicate,
    sizeBytes: 24 * _mb,
    date: DateTime(2026, 9, 28),
  ),
  MediaItem(
    id: '15',
    name: 'IMG_4402 (1).HEIC',
    category: MediaCategory.duplicate,
    sizeBytes: 12 * _mb,
    date: DateTime(2026, 9, 25),
  ),
];
